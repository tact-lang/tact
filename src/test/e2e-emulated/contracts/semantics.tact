struct SA {
    a1: Int;
    a2: SB;
}

struct SB {
    b1: Bool;
    b2: SC;
    b3: Int;
}

struct SC {
    c1: Int;
}

fun getNewStruct(s: SA): SA {
    // Reassign the parameter value
    // This does not change the struct passed as parameter to the function
    s = SA {a1: 0, a2: SB {b1: false, b2: SC {c1: 0}, b3: 0}};
    return s;
}

fun copyAndModifyStruct(s: SA): SA {
    // Change some fields in the struct given as parameter
    // Since structs are passed by value, this does not change the struct passed as parameter to the function
    s.a1 += 100;
    s.a2.b2.c1 += 1;
    return s;
}

extends mutates fun reassignStruct(self: SA) {
    // Reassigning the parameter will change the struct given as parameter
    self = SA {a1: 0, a2: SB {b1: false, b2: SC {c1: 0}, b3: 0}};
}

extends mutates fun changeSomeFields(self: SA) {
    // Change some fields in the struct given as parameter
    // This will change the struct passed as parameter to the function
    self.a1 += 100;
    self.a2.b2.c1 += 1;
}

fun getNewMap(m: map<Int,SA>): map<Int,SA> {
    // Reassign the parameter value
    // This does not change the map passed as parameter to the function
    m = emptyMap();
    
    m.set(1, SA {a1: 0, a2: SB {b1: false, b2: SC {c1: 0}, b3: 0}});

    return m;
}

fun copyAndModifyMap(m: map<Int,SA>): map<Int,SA> {
    // Change some entries in the map given as parameter
    // Since maps are passed by value, this does not change the map passed as parameter to the function

    // Note that it is not possible to directly change the struct in entry 1 like 
    // m.get(1)!!.a2.b2.c1 += 40;
    // because the compiler only allows path expressions on the left of assignments.
    // So, we need to read m.get(1) and store it in a variable:

    let c = m.get(1)!!;

    // Then change the struct field here
    c.a2.b2.c1 += 40;

    // And then reassign entry 1
    // If we do not reassign entry 1 in m, the change we did in the previous line
    // to c will not be reflected in the map m, because struct c is a copy!!! (Recall that
    // structs are assigned by value as well).
    // To check the previous claim, this function will return an emptyMap()
    // if m.get(1)!!.a2.b2.c1 == c.a2.b2.c1 at this point (which will not be true):

    if (m.get(1)!!.a2.b2.c1 == c.a2.b2.c1) {
        return emptyMap();
    }

    m.set(1, c);

    // Now delete entries 2 and 3

    m.del(2);
    m.del(3);

    return m;
}

/*
The following two functions are not allowed by the compiler, because mutating functions 
can only have reference types as first argument.

This has an IMPORTANT consequence: since maps are passed by value,
NO map can be modified when passed to a function. Is there a reason for 
this design decision?

extends mutates fun reassignMap(self: map<Int,SA>) {
    // Reassigning the parameter will change the map given as parameter
    self = emptyMap();
    self.set(1, SA {a1: 0, a2: SB {b1: false, b2: SC {c1: 0}, b3: 0}});
}

extends mutates fun changeSomeEntries(self: map<Int,SA>) {
    // Change some entries in the map given as parameter
    // This will change the map passed as parameter to the function

    // Similar to comments in function copyAndModifyMap, it is not possible
    // to directly mutate the struct in entry 1 of the map.
    // So, first make a local copy of the struct
    
    let c = self.get(1)!!;

    // Modify the struct
    c.a2.b2.c1 += 30;

    // And assign it back into entry 1, because c is a copy so far
    // To check the previous claim, this function will return an emptyMap()
    // if self.get(1)!!.a2.b2.c1 == c.a2.b2.c1 at this point (which will not be true):

    if (self.get(1)!!.a2.b2.c1 == c.a2.b2.c1) {
        return emptyMap();
    }

    self.set(1, c);

    // Now delete entries 2 and 3

    self.del(2);
    self.del(3);
}
*/

contract SemanticsTester {

    // Currently, declaring fields like this:
    // 
    // sC: SC = SC {c1: 5}; 
    // sB: SB = SB {b1: true, b2: sC, b3: 10};
    // sA: SA = SA {a1: 20, a2: sB};
    //
    // or like this:
    //
    // sC: SC = SC {c1: 5}; 
    // sB: SB = SB {b1: true, b2: self.sC, b3: 10};
    // sA: SA = SA {a1: 20, a2: self.sB};
    //
    // gives a compilation error. So, we need to define the fields like this:

    sC: SC = SC {c1: 5}; 
    sB: SB = SB {b1: true, b2: SC {c1: 5}, b3: 10};
    sA: SA = SA {a1: 20, a2: SB {b1: true, b2: SC {c1: 5}, b3: 10}};
    uB: SB;

    // An alternative would be to assign them in the init() function, which allows the use of self.


    // Declare some maps

    mA: map<Int,SA>;
    mB: map<Int,Bool>;

    init() { 
        self.uB.b1 = false;       // What is the meaning of this? self.uB is not initialized.
                                  // Is this instantiating a partially constructed struct SB?
                                  // Nevertheless, it is not possible to check if it is a partially initialized
                                  // struct because the compiler will not allow referencing self.uB in an expression
                                  // until self.uB is actually assigned.
        self.uB.b2 = SC {c1: 40};
        self.uB = SB {b1: false, b2: SC {c1: 0}, b3: 11};
        self.uB.b3 = 14;          // Getter structInitCheck later checks that init respects 
                                  // this last assignment

        self.sB.b1 = false;
        self.sB.b2 = SC {c1: 3};

        // Initialize the mA map
        self.mA.set(1, self.sA);     // The compiler does not complain that self.mA is not initialized, because
                                     // map fields in contracts are implicitly initialized as empty.
                                     // Function checkMapInit will later check this
        
        // Make a copy of sA to assign a different key value pair in the map
        let s = self.sA;
        s.a2.b2.c1 = 100;
        s.a2.b3 = 0;

        self.mA.set(2, s);

        // Modify struct again to insert another key-value pair
        s.a2.b2.c1 = 150;
        s.a1 = 5;
        s.a2.b1 = false;

        self.mA.set(3, s);
    }

    receive() { }

    // IMPORTANT: The operator == does not allow comparing two structs.
    // So, to compare if two structs are equal using ==, one needs to compare each
    // field of both structs manually.


    get fun checkAllContractFieldsAreUnchanged(): Bool {
        
        let result = 
               // self.uB is correctly initialized

               self.uB.b1 == false &&
               self.uB.b2.c1 == 0 &&
               self.uB.b3 == 14 &&

               // init does not modify default value of self.sA
               
               self.sA.a1 == 20 && 
               self.sA.a2.b1 == true &&
               self.sA.a2.b2.c1 == 5 &&
               self.sA.a2.b3 == 10 &&

               // init modifies default value of self.sB

               self.sB.b1 == false &&
               self.sB.b2.c1 == 3 &&
               self.sB.b3 == 10 &&

               // init does not change default value of self.sC.

               self.sC.c1 == 5 &&

               // the map self.mB is empty
               // (self.mB == emptyMap()) &&  // Commented out because it causes an internal compiler error (see issue #808)
               self.mB == null &&    // Equivalent way of saying it is empty 
               self.mB.isEmpty() &&   // Another equivalent way of saying it is empty

               // the map self.mA has these three key-value pairs:

               self.mA.get(1)!!.a1 == 20 && 
               self.mA.get(1)!!.a2.b1 == true &&
               self.mA.get(1)!!.a2.b2.c1 == 5 &&
               self.mA.get(1)!!.a2.b3 == 10 &&

               self.mA.get(2)!!.a1 == 20 && 
               self.mA.get(2)!!.a2.b1 == true &&
               self.mA.get(2)!!.a2.b2.c1 == 100 &&
               self.mA.get(2)!!.a2.b3 == 0 &&

               self.mA.get(3)!!.a1 == 5 && 
               self.mA.get(3)!!.a2.b1 == false &&
               self.mA.get(3)!!.a2.b2.c1 == 150 &&
               self.mA.get(3)!!.a2.b3 == 0;

        // And no other entries
        foreach (k, _ in self.mA) {
            result = result && (k == 1 || k == 2 || k == 3);
        }

        return result;
    }

    // Assigning a struct to a variable preserves fields

    get fun structAssign1(): Bool { 
        let s = self.sA;

        // The fields of s and self.sA are equal, and the values did not change
        return s.a1 == self.sA.a1 && 
               s.a2.b1 == self.sA.a2.b1 &&
               s.a2.b2.c1 == self.sA.a2.b2.c1 &&
               s.a2.b3 == self.sA.a2.b3 &&
               s.a1 == 20 && 
               s.a2.b1 == true &&
               s.a2.b2.c1 == 5 &&
               s.a2.b3 == 10 &&
               self.checkAllContractFieldsAreUnchanged();
    }

    // Assignment of structs is done by value

    get fun structAssign2(): Bool { 
        // Make a local copy of the struct
        let s = self.sA;

        // Modify two fields in the local copy
        s.a1 = 50;
        s.a2.b2.c1 = 70;

        // Make a copy of an internal struct of s
        let t = s.a2;

        // Modify the copy
        t.b3 = 100;
        
        // self.sA remains unchanged,
        // the copy t inherits the value b2.c1 = 70 modified by s,
        // the copy s does not change its b3 field.
        return self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 50 && 
               s.a2.b1 == true &&
               s.a2.b2.c1 == 70 &&
               s.a2.b3 == 10 &&
               t.b1 == true &&
               t.b2.c1 == 70 &&
               t.b3 == 100;
    }

    get fun paramStruct1(): Bool {
        
        // This should not modify self.sA.

        let s = getNewStruct(self.sA);

        return self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 0 && 
               s.a2.b1 == false &&
               s.a2.b2.c1 == 0 &&
               s.a2.b3 == 0;
    }

    get fun paramStruct2(): Bool {
        
        // This should not modify self.sA.

        let s = copyAndModifyStruct(self.sA);

        return self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 120 && 
               s.a2.b1 == true &&
               s.a2.b2.c1 == 6 &&
               s.a2.b3 == 10;
    }

    get fun mutateParamStruct1(): Bool {

        let s = self.sA;

        // This should reassign s, but leave self.sA unchanged.

        s.reassignStruct();

        return self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 0 && 
               s.a2.b1 == false &&
               s.a2.b2.c1 == 0 &&
               s.a2.b3 == 0;
    }

    get fun mutateParamStruct2(): Bool {

        let s = self.sA;

        // This should mutate some fields of s, but leave self.sA unchanged.
        
        s.changeSomeFields();

        return self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 120 && 
               s.a2.b1 == true &&
               s.a2.b2.c1 == 6 &&
               s.a2.b3 == 10;
    }


    // Assigning a map to a variable preserves contents

    get fun mapAssign1(): Bool { 
        let s = self.mA;

        // The entries of s and self.mA are equal, and the values did not change
        let result = 
               self.mA.get(1)!!.a1 == s.get(1)!!.a1 && 
               self.mA.get(1)!!.a2.b1 == s.get(1)!!.a2.b1 &&
               self.mA.get(1)!!.a2.b2.c1 == s.get(1)!!.a2.b2.c1 &&
               self.mA.get(1)!!.a2.b3 == s.get(1)!!.a2.b3 &&

               self.mA.get(2)!!.a1 == s.get(2)!!.a1 && 
               self.mA.get(2)!!.a2.b1 == s.get(2)!!.a2.b1 &&
               self.mA.get(2)!!.a2.b2.c1 == s.get(2)!!.a2.b2.c1 &&
               self.mA.get(2)!!.a2.b3 == s.get(2)!!.a2.b3 &&

               self.mA.get(3)!!.a1 == s.get(3)!!.a1 && 
               self.mA.get(3)!!.a2.b1 == s.get(3)!!.a2.b1 &&
               self.mA.get(3)!!.a2.b2.c1 == s.get(3)!!.a2.b2.c1 &&
               self.mA.get(3)!!.a2.b3 == s.get(3)!!.a2.b3 &&

               s.get(1)!!.a1 == 20 && 
               s.get(1)!!.a2.b1 == true &&
               s.get(1)!!.a2.b2.c1 == 5 &&
               s.get(1)!!.a2.b3 == 10 &&

               s.get(2)!!.a1 == 20 && 
               s.get(2)!!.a2.b1 == true &&
               s.get(2)!!.a2.b2.c1 == 100 &&
               s.get(2)!!.a2.b3 == 0 &&

               s.get(3)!!.a1 == 5 && 
               s.get(3)!!.a2.b1 == false &&
               s.get(3)!!.a2.b2.c1 == 150 &&
               s.get(3)!!.a2.b3 == 0 &&
               self.checkAllContractFieldsAreUnchanged();
        
        // And no other entries
        foreach (k, _ in s) {
            result = result && (k == 1 || k == 2 || k == 3);
        }

        return result;
    }

    // Assignment of maps is done by value

    get fun mapAssign2(): Bool { 
        // Make a local copy of the map
        let s = self.mA;

        // Modify an entry in the local copy
        s.set(1, SA {a1: 0, a2: SB {b1: false, b2: self.sC, b3: 2}});

        // The compiler does not allow directly changing the contents of a struct inside an entry:
        // s.get(2)!!.a2.b2.c1 = 7;
        // Only path expressions are allowed on the left of the assignment operator =
        
        // self.mA remains unchanged (including the rest of fields)
        // The rest of the entries in s remain identical to self.mA.
        let result = 
               self.checkAllContractFieldsAreUnchanged() &&
               
               s.get(1)!!.a1 == 0 && 
               s.get(1)!!.a2.b1 == false &&
               s.get(1)!!.a2.b2.c1 == 5 &&
               s.get(1)!!.a2.b3 == 2 &&

               s.get(2)!!.a1 == 20 && 
               s.get(2)!!.a2.b1 == true &&
               s.get(2)!!.a2.b2.c1 == 100 &&
               s.get(2)!!.a2.b3 == 0 &&

               s.get(3)!!.a1 == 5 && 
               s.get(3)!!.a2.b1 == false &&
               s.get(3)!!.a2.b2.c1 == 150 &&
               s.get(3)!!.a2.b3 == 0;

        // And no other entries
        foreach (k, _ in s) {
            result = result && (k == 1 || k == 2 || k == 3);
        }

        return result;
    }

    get fun paramMap1(): Bool {
        
        // This should not modify self.mA.

        let s = getNewMap(self.mA);

        let result = 
               self.checkAllContractFieldsAreUnchanged() &&
               s.get(1)!!.a1 == 0 && 
               s.get(1)!!.a2.b1 == false &&
               s.get(1)!!.a2.b2.c1 == 0 &&
               s.get(1)!!.a2.b3 == 0;
        
        // And no other entries 
        foreach (k, _ in s) {
            result = result && k == 1;
        }

        return result;
    }

    get fun paramMap2(): Bool {
        
        // This should not modify self.mA.
        // In the copy: it will delete entries 2 and 3 and modify entry 1.
        let s = copyAndModifyMap(self.mA);

        let result = 
               self.checkAllContractFieldsAreUnchanged() &&
               s.get(1)!!.a1 == 20 && 
               s.get(1)!!.a2.b1 == true &&
               s.get(1)!!.a2.b2.c1 == 45 &&
               s.get(1)!!.a2.b3 == 10;
        
        // And no other entries 
        foreach (k, _ in s) {
            result = result && k == 1;
        }

        return result;
    }

/*

We cannot test the effect of a map given as parameter to a mutating function,
because mutating functions only allow reference types in their self parameter.

    get fun mutateParamMap1(): Bool {

        let s = self.mA;

        // This should reassign s, but leave self.mA unchanged.

        s.reassignMap();

        let result = 
               self.checkAllContractFieldsAreUnchanged() &&
               s.get(1)!!.a1 == 0 && 
               s.get(1)!!.a2.b1 == false &&
               s.get(1)!!.a2.b2.c1 == 0 &&
               s.get(1)!!.a2.b3 == 0;
        
        // And no other entries 
        foreach (k, _ in s) {
            result = result && k == 1;
        }

        return result;
    }

    get fun mutateParamMap2(): Bool {

        let s = self.mA;

        // This should mutate entry 1 in s, and delete entries 2 and 3, but leave self.mA unchanged.
        
        s.changeSomeEntries();

        let result = 
               self.checkAllContractFieldsAreUnchanged() &&
               s.get(1)!!.a1 == 20 && 
               s.get(1)!!.a2.b1 == true &&
               s.get(1)!!.a2.b2.c1 == 35 &&
               s.get(1)!!.a2.b3 == 10;
        
        // And no other entries 
        foreach (k, _ in s) {
            result = result && k == 1;
        }

        return result;
    }
*/

}