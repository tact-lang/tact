struct OptionInner {
    x: Int;
}

struct MapInner {
    y: Int;
}

struct ComplexStruct {
    opt: OptionInner?;
    m: map<Int, MapInner>;
}

contract TestContract {
    receive() {
        let tempMap: map<Int, MapInner> = emptyMap();
        tempMap.set(1, MapInner { y: 99 });
        tempMap.set(2, MapInner { y: 100 });
        let cs = ComplexStruct{
            opt: OptionInner { x: 42 },
            m: tempMap
        };
    }
}
