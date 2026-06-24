struct Demo {
    flag: Bool?;  // no default
    number: Int = 5;
}

contract TestContract {
    demo: Demo = Demo{flag: null, number: 5};

    init() {
        self.demo = Demo{flag: null, number: 10};
    }

    receive() {
        let _ = self.demo;
    }
}