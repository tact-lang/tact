struct A { val: Int; }

contract ConstsWithNestedStruct {
    const C: Int = 123;
    
    s: A = A{ val: self.C };
}