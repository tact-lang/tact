struct Rec {
    a: Int?;
    b: Int;
}

contract AllDefaultNulls {
    rec: Rec = Rec { a: null, b: 22 };
}