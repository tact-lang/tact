struct ParamStruct { x: Int; y: String; flag: Bool; }

contract ParamHolder {
    data: ParamStruct?;

    init() {
        self.data = ParamStruct{ x: 5, y: "foo", flag: true };
    }
}