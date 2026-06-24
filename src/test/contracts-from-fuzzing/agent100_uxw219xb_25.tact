struct DeepOptional {
    opt: Int?;
    flag: Bool?;
    text: String?;
}

contract DefOpt {
    data: DeepOptional = DeepOptional{
        opt: null,
        flag: null,
        text: null
    };
}