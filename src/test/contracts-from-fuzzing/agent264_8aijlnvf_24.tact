struct Atomic {
    flag: Bool;
    text: String;
}

contract OptionalAtomic {
    atom: Atomic?;

    init() {
        self.atom = Atomic{
            flag: true,
            text: "hello",
        };
    }
}