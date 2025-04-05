struct SubData {
    mandatory: Int;
    opt: Int?;
}

struct ComplexNested {
    sub: SubData;
    items: map<Int, SubData>;
    flag: Bool;
}

contract TestOptionalMap {
    receive() {
        let m: map<Int, SubData> = emptyMap();
        m.set(1, SubData{ mandatory: 10, opt: 100 });
        m.set(2, SubData{ mandatory: 20, opt: null });

        let cn: ComplexNested = ComplexNested{
            sub: SubData{ mandatory: 1, opt: null },
            items: m,
            flag: true
        };
    }
}
