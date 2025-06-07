struct S1 { v: Int?; }
struct S2 { s: S1?; }
struct S3 { s: S2?; }

contract RecOpt {
    r: S3 = S3{ s:null };
}