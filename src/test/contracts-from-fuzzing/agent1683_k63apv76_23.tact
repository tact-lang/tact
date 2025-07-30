struct NestedOptional {
    inner: Int?;
}

contract TestContract {
    x: NestedOptional = NestedOptional{ inner: null };
    y: NestedOptional = NestedOptional{ inner: 123 };
}