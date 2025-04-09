struct A {
    flag: Bool;
    label: String;
}

contract DeepInit {
    data: A;
    init() {
        self.data = A{
            flag: true,
            label: "init",
        };
    }
}