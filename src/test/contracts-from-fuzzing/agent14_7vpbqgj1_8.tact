struct NestedComplex {
    Opt: Int?;
    Dict: map<Int, Int>;
}

contract Test {
    receive() {
        let dict: map<Int, Int> = emptyMap();
        dict.set(10, 100);
        dict.set(20, 200);
        let nc: NestedComplex = NestedComplex{
            Opt: 42,
            Dict: dict
        };
    }
}
