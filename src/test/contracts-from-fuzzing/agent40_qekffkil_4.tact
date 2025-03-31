struct Pair {
    first: Int;
    second: Bool;
}

contract TestComposite {
    get fun getPair(): Pair {
        return Pair { first: 10, second: true };
    }

    receive() {}
}
