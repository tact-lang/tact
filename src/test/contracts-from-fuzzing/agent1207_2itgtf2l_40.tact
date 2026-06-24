struct NestedOptStruct {
    inner: Int?;
    message: String?;
}

contract OptStruct 
{
    f: NestedOptStruct?;

    init() {
        self.f = NestedOptStruct{ inner: null, message: null };
    }
}