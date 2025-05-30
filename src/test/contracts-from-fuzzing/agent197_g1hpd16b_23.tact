struct SStr {
    a: String = "";
    b: String? = null;
}

contract StringNullVsEmpty {
    s: SStr = SStr{ a: "", b: null };
}