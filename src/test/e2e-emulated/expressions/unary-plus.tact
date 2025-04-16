contract TestContract {
    receive() {}

    get fun foo(): Int {
        let two = 2;
        return +two;
    }

    get fun foo1(): Int {
        let two = 2;
        return +(+(+two));
    }

    get fun foo2(): Int {
        let one = 1;
        let two = 2;
        return one - + - + - + two;
    }
}
