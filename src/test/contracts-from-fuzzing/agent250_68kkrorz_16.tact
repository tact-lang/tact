struct SerializeOpt {
    bigOpt: Int? as uint120;
    strOpt: String?;
}

contract SerializationOptional {
    data: SerializeOpt;

    init() {
        self.data = SerializeOpt{bigOpt:null, strOpt:null};
    }
}