struct DeepNested {
    b: Int;
}

struct DeepOpt {
    c: Int;
}

struct DeepMixed {
    a: Int;
    nested: DeepNested;
    m: map<Int, Bool>;
    opt: DeepOpt?;
}

contract TestDeepMixed {
    receive() {
        let myMap: map<Int, Bool> = emptyMap();
        myMap.set(1, true);
        myMap.set(2, false);

        let dm: DeepMixed = DeepMixed{
            a: 777,
            nested: DeepNested{ b: 888 },
            m: myMap,
            opt: DeepOpt{ c: 999 }
        };
    }
}
