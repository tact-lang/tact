struct OneField {
    bigtext: String;
}

contract OneFieldTest {
    x: OneField;
    
    init() {
        self.x = OneField{
            bigtext: "abcdefghijklmnopqrstuvwxyz"
        };
    }
}