struct EitherStringOrInt {
    s: String?;
    n: Int?;
}

contract Choice {
    e: EitherStringOrInt = EitherStringOrInt{ s:null, n:123 };
}
