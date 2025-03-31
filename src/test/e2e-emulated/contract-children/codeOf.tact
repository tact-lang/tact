contract CodeOfTester {
    value: Int;
    value2: Bool;

    init(value: Int, value2: Bool) {
        self.value = value;
        self.value2 = value2;
    }

    receive() {}

    get fun selfCode(): Cell {
        return codeOf CodeOfTester;
    }

    get fun childCode(): Cell {
        return codeOf ChildContract;
    }

    get fun testThatMyCodeEqualToCodeOfSelf(): Bool {
        return myCode() == codeOf CodeOfTester;
    }

    get fun testThatMyCodeNotEqualToCodeOfChild(): Bool {
        return myCode() != codeOf ChildContract;
    }

    get fun testThatInitOfSelfCodeEqualToCodeOf(): Bool {
        return initOf CodeOfTester(0, false).code == codeOf CodeOfTester;
    }

    get fun testThatInitOfChildCodeEqualToCodeOf(): Bool {
        return initOf ChildContract(0).code == codeOf ChildContract;
    }

    get fun testThatInitOfSelfCodeNotEqualToCodeOfChild(): Bool {
        return initOf CodeOfTester(0, false).code != codeOf ChildContract;
    }
}

contract ChildContract {
    value: Int = 0;

    init(value: Int) {
        self.value = value;
    }

    receive() {}

    get fun value(): Int {
        return self.value;
    }
}
