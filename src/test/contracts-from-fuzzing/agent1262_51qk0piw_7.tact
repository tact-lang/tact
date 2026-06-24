struct BigOptional {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Int?;
    opt5: Bool?;
    opt6: String?;
}

contract ComplexOptional {
    data: BigOptional = BigOptional{
        opt1: null,
        opt2: null,
        opt3: null,
        opt4: 5,
        opt5: true,
        opt6: "hello",
    };
}