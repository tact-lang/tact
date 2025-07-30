struct DeepNull {
    opt: Int?;
}

contract NullInit {
    nest: DeepNull;
    init() {
        self.nest = DeepNull{ opt: null };
    }
}