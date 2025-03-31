contract TestArbText {
    text: String = "default";

    receive(str: String) {
         // On any text message, set the contract variable to the message text.
         self.text = str;
    }
}