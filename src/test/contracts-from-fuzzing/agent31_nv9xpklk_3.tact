struct AB {
    a: Int;
    b: Bool;
}

contract CompositeGetter {
    a: AB = AB{ a: 42, b: true };

    receive() {}

    get fun getAB(): AB {
        return self.a;
    }
}
