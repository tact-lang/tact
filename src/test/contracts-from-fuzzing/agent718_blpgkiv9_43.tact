struct NestedContractFields {
    a: Int;
    b: Bool;
}
contract WrapNestedContractFields {
    val: NestedContractFields;
    init() {
        self.val = NestedContractFields{ a:1, b:true };
    }
}