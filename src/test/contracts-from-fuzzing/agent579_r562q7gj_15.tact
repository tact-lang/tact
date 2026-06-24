contract StringVars {
    txt1: String = "";
    txt2: String;
    txt3: String;
    txt4: String;

    init() {
        self.txt2 = "Hello\nWorld";
        self.txt3 = "Emoji: 😊";
        self.txt4 = "Esc\"aped";
    }
}