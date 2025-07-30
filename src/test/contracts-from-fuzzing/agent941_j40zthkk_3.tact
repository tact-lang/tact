struct DeepStruct {
    inner: InnerStruct;
    value: Int;
}

struct InnerStruct {
    flag: Bool;
    score: Int;
}

contract NestedStructField {
    deep: DeepStruct = DeepStruct{inner: InnerStruct{flag: true, score: 7}, value: 99};

    receive() {
        self.deep = DeepStruct{inner: InnerStruct{flag: false, score: 15}, value: 100};
    }
}