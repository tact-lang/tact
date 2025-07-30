contract OptionsOverFields {
    fa: Int?;
    fb: Bool?;
    fc: String?;

    init() {
        self.fa=null; self.fb=null; self.fc=null;
    }

    receive() {
        self.fa=11; self.fb=true; self.fc="ok";
    }
}