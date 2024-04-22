import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "BMI Calculator"

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: "Enter your weight (kg):"
        }

        TextField {
            id: weightInput
            placeholderText: "Enter weight in kg"
            validator: DoubleValidator { bottom: 0.1 }
            width: parent.width
        }

        Text {
            text: "Enter your height (cm):"
        }

        TextField {
            id: heightInput
            placeholderText: "Enter height in cm"
            validator: DoubleValidator { bottom: 0.1 }
            width: parent.width
        }

        Button {
            text: "Calculate BMI"
            onClicked: calculateBMI()
        }

        Text {
            id: resultText
            text: ""
        }

        Text {
            id: resultDescription
            text: ""
        }
    }

    function calculateBMI() {
        var weight = parseFloat(weightInput.text)
        var height = parseFloat(heightInput.text) / 100 // Convert cm to meters
        if (!isNaN(weight) && !isNaN(height) && height > 0 && weight > 0) {
            var bmi = weight / (height * height)
            resultText.text = "Your BMI: " + bmi.toFixed(2)
            displayBMImeasures(bmi)
        } else {
            resultText.text = "Please enter valid weight and height"
        }
    }

    function displayBMImeasures(bmi) {
        if (bmi < 18.5) resultDescription.text = "You are underweight!!!"
        else if (bmi >= 18.5 && bmi < 25) resultDescription.text = "You are healthy!!!"
        else if (bmi >= 25 && bmi < 30) resultDescription.text = "You are overweight!!!"
        else resultDescription.text = "You are obese!!!"
    }
}
