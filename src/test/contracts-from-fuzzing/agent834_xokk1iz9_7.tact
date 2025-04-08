struct ManyOptional {
    v1: Int?;
    v2: Bool?;
    v3: String?;
    v4: Address?;
}

contract OptionalStore {
    data: ManyOptional = ManyOptional{v1: null, v2: null, v3: null, v4: null};
}
