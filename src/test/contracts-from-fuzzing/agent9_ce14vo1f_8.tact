struct InnerMap {
    unbox: map<Int, Int>
}

contract NestedMapIteration {
    myNested: map<Int, InnerMap>;

    init() {
         self.myNested = emptyMap();
         let inner: map<Int, Int> = emptyMap();
         inner.set(1, 10);
         let wrapper: InnerMap = InnerMap{ unbox: inner };
         self.myNested.set(100, wrapper);
         
         // Iterate over the outer map
         foreach (outerKey, outerVal in self.myNested) {
             // Iterate over the inner map contained in the struct
             foreach (innerKey, innerVal in outerVal.unbox) {
                 // Increase each value by 5
                 outerVal.unbox.set(innerKey, innerVal + 5);
             }
         }
    }

    get fun getSum(): Int {
       let wrapped: InnerMap? = self.myNested.get(100);
       return wrapped!!.unbox.get(1)!!; // expected: 15
    }
}
