struct InnerStruct {
    value: Int;
}

struct OuterStruct {
    inner: map<Int, InnerStruct>;
}

contract TestNestedMaps {
    m: map<Address, OuterStruct>;

    init() {
         self.m = emptyMap();
         let inner: map<Int, InnerStruct> = emptyMap();
         let innerStruct: InnerStruct = InnerStruct { value: 123 };
         inner.set(1, innerStruct);
         let outer: OuterStruct = OuterStruct { inner: inner };
         self.m.set(sender(), outer);
    }

    receive() {
         let outer: OuterStruct? = self.m.get(sender());
         if (outer != null) {
             // We need to unwrap the optional before accessing fields
             let isSet: Bool = outer!! .inner.exists(1);
         }
    }
}
