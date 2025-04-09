struct VeryDeep {
    inner: InnerStruct;
}

struct InnerStruct {
    deep: DeeperStruct;
}

struct DeeperStruct {
    value: Int;
    flag: Bool;
}

contract DeepPersist {
    state: VeryDeep = VeryDeep{ inner: InnerStruct{ deep: DeeperStruct{ value: 1, flag: true } } };
}