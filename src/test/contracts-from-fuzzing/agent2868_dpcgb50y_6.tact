struct DefaultsVsInit {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultsVsInitStorage {
    val: DefaultsVsInit;

    init() {
        self.val = DefaultsVsInit{
            a: 2,
            b: true,
            c: "world"
        };
    }
}