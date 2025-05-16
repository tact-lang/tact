struct InnerOptional {
    x: Int;
}

struct OuterOptional {
    inner: InnerOptional?;
    y: Int;
}

contract TestOptionalStruct {
    receive() {
         // Case 1: with non-null optional
         let o1 = OuterOptional { inner: InnerOptional { x: 123 }, y: 456 };
         dump(o1.inner!!.x + o1.y);
         
         // Case 2: with null optional; use ternary operator to safely extract field
         let o2 = OuterOptional { inner: null, y: 789 };
         dump((o2.inner != null ? o2.inner!!.x : 0) + o2.y);
    }
}
