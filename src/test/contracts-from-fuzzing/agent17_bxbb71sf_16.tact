struct Example {
    x: Int?;
}

contract Test {
    foo: Example;

    init() {
        self.foo = Example{ x: 5};
    }

    fun testOpt(): Int {
        if (self.foo.x != null) {
            return self.foo.x!!;
        }
        return 100;
    }

    receive() {
        let result = self.testOpt();
        dump(result);
    }
}
