struct Nested {
    sub: map<Int, Int>;
}

contract TestNestedMaps {
    get fun test(): Int {
        let m: map<Address, Nested> = emptyMap();
        let nested: Nested = Nested{ sub: emptyMap() };
        nested.sub.set(55, 600);
        m.set(myAddress(), nested);
        return m.get(myAddress())!!.sub.get(55)!!;
    }
}
