struct AllOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AllNull {
    f: AllOptional = AllOptional{ a:null, b:null, c:null };
}
