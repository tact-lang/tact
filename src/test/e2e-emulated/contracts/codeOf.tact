contract CodeOfTester {
    receive() {}

    get fun selfCode(): Cell {
        return codeOf CodeOfTester;
    }

    get fun childCode(): Cell {
        return codeOf ChildContract;
    }
}

contract ChildContract {
    value: Int = 0;

    receive() {}

    get fun value(): Int {
        return self.value;
    }
}
