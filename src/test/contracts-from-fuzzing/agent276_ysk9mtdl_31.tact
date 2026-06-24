struct MidDefaults {
    a: Int = 42;
    b: Bool;
}

contract DefaultsInStructs2 {
    item: MidDefaults;

    init() {
        self.item = MidDefaults{
            a: 99, 
            b: true
        };
    }
}
