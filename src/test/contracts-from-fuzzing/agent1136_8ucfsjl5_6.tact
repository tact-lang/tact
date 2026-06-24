contract MultipleOptionalsNested {
    config: ConfigStruct?;

    init() {
        self.config = null;
    }
}

struct ConfigStruct {
    name: String?;
    flag: Bool?;
    details: Details?;
}

struct Details {
    id: Int?;
    enabled: Bool?;
}
