struct StrOpt {
    foo: String?;
    bar: String?;
    baz: String?;
}

contract TestContract {
    s: StrOpt = StrOpt{ foo:null, bar:null, baz:null };
}