struct SingleBool { b: Bool; }

contract SingleFieldStruct {
    s: SingleBool;
    init() {
        self.s = SingleBool{ b:true };
    }
}