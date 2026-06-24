trait DataTrait {
    dt: DataStruct;
}

struct DataStruct {
    x: Int;
    y: Bool?;
}

contract TraitNested with DataTrait {
    dt: DataStruct;

    init() {
        self.dt = DataStruct{ x: 1, y: null };
    }
}
