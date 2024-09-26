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

// Wrapper struct in order to pass maps to mutating functions. See issue #815.
// Also, it is useful for nesting maps inside maps.
struct MapWrapper {
    m: map<Int,SA>
}

/**** Auxiliary functions for structs **********/

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

extends fun copyStruct(self: SA): SA {
    // Since structs are passed by value, "self" will be a copy of the struct given as parameter
    return self;
}

// Identity function, just to test chaining of mutating functions.
extends mutates fun reflectStruct(self: SA): SA {
    return self;
}

extends mutates fun incrementIntFields(self: SA): SA {
    self.a1 += 1;
    self.a2.b2.c1 += 1;
    self.a2.b3 += 1;
    return self;
}

extends mutates fun flipBooleanFields(self: SA): SA {
    self.a2.b1 = !self.a2.b1;
    return self;
}


/**** Auxiliary functions for maps **********/

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
Currently, the compiler does not allow passing maps to extension (and hence mutating) functions 
in their "self" argument.

One workaround is to wrap the map using a struct, since structs are allowed in extension functions 
(see issue #815)
*/

extends mutates fun reassignMap(self: MapWrapper) {
    // Reassigning the parameter will change the map given as parameter
    self = MapWrapper {m: emptyMap()};
    self.m.set(1, SA {a1: 0, a2: SB {b1: false, b2: SC {c1: 0}, b3: 0}});
}

extends mutates fun changeSomeEntries(self: MapWrapper) {
    // Change some entries in the map given as parameter
    // This will change the map passed as parameter to the function

    // Similar to comments in function copyAndModifyMap, it is not possible
    // to directly mutate the struct in entry 1 of the map.
    // So, first make a local copy of the struct.
    
    let c = self.m.get(1)!!;

    // Modify the struct
    c.a2.b2.c1 += 30;

    // And assign it back into entry 1, because c is a copy so far.
    // To check the previous claim, this function will immediately return
    // if self.m.get(1)!!.a2.b2.c1 == c.a2.b2.c1 at this point (which will not be true):

    if (self.m.get(1)!!.a2.b2.c1 == c.a2.b2.c1) {
        return;
    }

    self.m.set(1, c);

    // Now delete entries 2 and 3

    self.m.del(2);
    self.m.del(3);
}

extends fun unwrapAndCopyMap(self: MapWrapper): map<Int,SA> {
    // Since structs are passed by value, "self" will be a copy of the wrapped map given as parameter
    // Hence, the unwrapped map is a copy of the map.
    return self.m;
}

extends mutates fun unwrapMap(self: MapWrapper): map<Int,SA> {
    // Even though "self" is a copy, the mutates function will assign the copy back into "self" once the function finishes.
    // Observe that the function will return a copy of the wrapped map as well.
    // This means that there are actually TWO assignments when one does something like this:
    // m = wm.unwrapMap();
    // After "unwrapMap" finishes execution, wm will be reassigned with the copy of self (which in this case is identical
    // to the input to "unwrapMap"), and m will be assigned with "self.m" (computed using the copy of "self").
    return self.m;
}

// Identity function, just to test chaining of mutating functions.
extends mutates fun reflectMap(self: MapWrapper): MapWrapper {
    return self;
}

/**** Auxiliary functions for contracts **********/

fun copyAndModifyContract(c: SemanticsTester): SemanticsTester {
    // Since contracts are passed by value, this function creates a copy of the contract when called.
    // In other words, c is a copy of the contract passed as parameter to the function.

    // Let us modify some fields in the copy c
    c.uB = SB {b1: true, b2: SC {c1: 99}, b3: 98};
    c.mA.del(1);

    // It is also possible to call contract functions on the copy
    // This call will not change the state of c beyond those changes in the previous lines.
    c.structAssign2();

    return c;
}

extends mutates fun changeSomeContractFields(self: SemanticsTester) {
    // Change some fields in the contract given as parameter
    // This will change the contract passed as parameter to the function
    self.uB = SB {b1: true, b2: SC {c1: 77}, b3: 88};
    self.sA.a2.b2.c1 += 30;
}

// Identity function, but as a simple extends function.
extends fun copyContract(self: SemanticsTester): SemanticsTester {
    return self;
}

// Identity function, just to test chaining of mutating functions.
extends mutates fun reflectContract(self: SemanticsTester): SemanticsTester {
    return self;
}

extends mutates fun incrementIntFieldsInUB(self: SemanticsTester): SemanticsTester {
    self.uB.b2.c1 += 1;
    self.uB.b3 += 1;
    return self;
}

extends mutates fun flipBooleanFieldsInUB(self: SemanticsTester): SemanticsTester {
    self.uB.b1 = !self.uB.b1;
    return self;
}


/**** Auxiliary functions for integers **********/

extends mutates fun multiplyBy2(self: Int): Int {
    self *= 2;
    return self;
}

extends mutates fun increment(self: Int): Int {
    self += 1;
    return self;
}

extends mutates fun doNothing(self: Int): Int {
    return self;
}


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
    mC: map<Int,MapWrapper>;   // Simulate nested maps by wrapping them in a struct, 
                               // "Morally", mC has type map<Int,map<Int,SA>>.


    // Flag storing the result of calling method mutateContractState.
    // So that we can get the result using a getter method

    mutateContractStateResult: Bool = false;

    init() { 

        /***** Structs *****/

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

        
        /**** Maps *****/
        
        // Initialize the mA map
        self.mA.set(1, self.sA);     // The compiler does not complain that self.mA is not initialized, because
                                     // map fields in contracts are implicitly initialized as empty.
                                     // Function checkMapInit will later check this.
        
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

        // Initialize the mC map. The nested map will contain a copy of self.sA.
        let nestedMap = MapWrapper {m: emptyMap()};
        nestedMap.m.set(10, self.sA);
        self.mC.set(100, nestedMap);
        
        /****** Contracts *****/

        /* I commented out the following code because 
           reading the self variable inside init should not be allowed. See issue #816.
        
        let contract_copy = self;
        contract_copy.sC = SC {c1: 8};
        */
    }

    receive() { }

    receive("mutate") {
        self.mutateContractStateResult = self.mutateContractState();
    }


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
            result &&= (k == 1 || k == 2 || k == 3);
        }

        // The map self.mC has a single entry 100 -> MapWrapper {m: 10 -> self.sA}.
        foreach (k1, v1 in self.mC) {
            foreach (k2, v2 in v1.m) {
                result = result && 
                         k1 == 100 && 
                         k2 == 10 &&
                         
                         v2.a1 == 20 && 
                         v2.a2.b1 == true &&
                         v2.a2.b2.c1 == 5 &&
                         v2.a2.b3 == 10;
            }
        }

        return result;
    }

    /*************** Structs ********************/

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

    get fun testReturnedStructs(): Bool {
        // The call to the non-mutating extends function "copyStruct" always makes a copy
        // of the parameter struct. Therefore, passing the result to the mutating function 
        // "changeSomeFields" will modify the copy, not the original struct. 
    
        self.sA.copyStruct().changeSomeFields();

        let result = 
               self.checkAllContractFieldsAreUnchanged();

        // For the following test, make a copy of self.sA.
        let s = self.sA;

        // What is the effect of executing the following line?

        s.reflectStruct().changeSomeFields();

        // First, reflectStruct makes a copy of s. When reflectStruct finalizes, it assigns the copy back into
        // s. Additionally, reflectStruct returns the copy of s, call it s'. 
        // s' is then passed to changeSomeFields, which makes again a copy of s', call it s''.
        // changeSomeFields changes some fields of s'' and reassigns s' with this changed s''. 
        // Additionally changeSomeFields returns the changed s''.
        // Note that the only place where s is reassigned is after reflectStruct executes.
        // This means that the above expression does NOT change s.

        result = result && 
               self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 20 &&    
               s.a2.b1 == true &&
               s.a2.b2.c1 == 5 && 
               s.a2.b3 == 10;

        // Therefore, if we actually want to change s using changeSomeFields, we 
        // should split the chain steps:

        s.reflectStruct();   // Each step changes s
        s.changeSomeFields();

        // Note that doing the trick of assigning back s
        // 
        // s = s.reflectStruct().changeSomeFields();
        //
        // is not possible because changeSomeFields has void return type.

        // s is now changed by changeSomeFields, and the rest remains the same
        result = result && 
               self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 120 &&   
               s.a2.b1 == true &&
               s.a2.b2.c1 == 6 &&   
               s.a2.b3 == 10;

        // For further examples of chaining of mutating functions, see the tests mutatesChainStruct

        return result;
    }

    /*
    The following functions exemplify how to properly chain mutating functions.
    Each function in the chain returns a copy to the next function in the chain.
    Hence, to change the original variable, we need to reassign the value returned 
    from the last mutating function.
    */

    get fun mutatesChainStruct1(): Bool {
        let s = self.sA;
        s.reflectStruct().incrementIntFields().flipBooleanFields();  // s changed only by the first function
        
        let t = self.sA;
        t = t.reflectStruct().incrementIntFields().flipBooleanFields(); // Assign back to t the struct returned by the last function
        
        // The less confusing solution is to simply break the chain.
        // This solution even works when the last function in the chain has void return type.
        // Each step changes z
        let z = self.sA;
        z.reflectStruct();
        z.incrementIntFields();
        z.flipBooleanFields();

        return self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 20 &&    
               s.a2.b1 == true &&   
               s.a2.b2.c1 == 5 &&   
               s.a2.b3 == 10 &&     

               t.a1 == 21 &&    
               t.a2.b1 == false &&   
               t.a2.b2.c1 == 6 &&    
               t.a2.b3 == 11 &&

               z.a1 == 21 &&    
               z.a2.b1 == false &&   
               z.a2.b2.c1 == 6 &&    
               z.a2.b3 == 11;                

    }

    get fun mutatesChainStruct2(): Bool {
        let s = self.sA;
        s.reflectStruct().flipBooleanFields().incrementIntFields();
        
        let t = self.sA;
        t = t.reflectStruct().flipBooleanFields().incrementIntFields();
        
        let z = self.sA;
        z.reflectStruct();
        z.flipBooleanFields();
        z.incrementIntFields();

        return self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 20 &&    
               s.a2.b1 == true &&   
               s.a2.b2.c1 == 5 &&   
               s.a2.b3 == 10 &&     

               t.a1 == 21 &&    
               t.a2.b1 == false &&   
               t.a2.b2.c1 == 6 &&    
               t.a2.b3 == 11 &&

               z.a1 == 21 &&    
               z.a2.b1 == false &&   
               z.a2.b2.c1 == 6 &&    
               z.a2.b3 == 11;
    }

    get fun mutatesChainStruct3(): Bool {
        let s = self.sA;
        s.incrementIntFields().reflectStruct().flipBooleanFields();

        let t = self.sA;
        t = t.incrementIntFields().reflectStruct().flipBooleanFields();
        
        let z = self.sA;
        z.incrementIntFields();
        z.reflectStruct();
        z.flipBooleanFields();

        return self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 21 &&    
               s.a2.b1 == true &&   
               s.a2.b2.c1 == 6 &&   
               s.a2.b3 == 11 &&     

               t.a1 == 21 &&    
               t.a2.b1 == false &&   
               t.a2.b2.c1 == 6 &&    
               t.a2.b3 == 11 &&

               z.a1 == 21 &&    
               z.a2.b1 == false &&   
               z.a2.b2.c1 == 6 &&    
               z.a2.b3 == 11;
    }

    get fun mutatesChainStruct4(): Bool {
        let s = self.sA;
        s.incrementIntFields().flipBooleanFields().reflectStruct();

        let t = self.sA;
        t = t.incrementIntFields().flipBooleanFields().reflectStruct();

        let z = self.sA;
        z.incrementIntFields();
        z.flipBooleanFields();
        z.reflectStruct();

        return self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 21 &&    
               s.a2.b1 == true &&   
               s.a2.b2.c1 == 6 &&   
               s.a2.b3 == 11 &&     

               t.a1 == 21 &&    
               t.a2.b1 == false &&   
               t.a2.b2.c1 == 6 &&    
               t.a2.b3 == 11 &&

               z.a1 == 21 &&    
               z.a2.b1 == false &&   
               z.a2.b2.c1 == 6 &&    
               z.a2.b3 == 11;
    }    

    get fun mutatesChainStruct5(): Bool {
        let s = self.sA;
        s.flipBooleanFields().incrementIntFields().reflectStruct();

        let t = self.sA;
        t = t.flipBooleanFields().incrementIntFields().reflectStruct();

        let z = self.sA;
        z.flipBooleanFields();
        z.incrementIntFields();
        z.reflectStruct();

        return self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 20 &&    
               s.a2.b1 == false &&   
               s.a2.b2.c1 == 5 &&   
               s.a2.b3 == 10 &&     

               t.a1 == 21 &&    
               t.a2.b1 == false &&   
               t.a2.b2.c1 == 6 &&    
               t.a2.b3 == 11 &&

               z.a1 == 21 &&    
               z.a2.b1 == false &&   
               z.a2.b2.c1 == 6 &&    
               z.a2.b3 == 11;
    }

    get fun mutatesChainStruct6(): Bool {
        let s = self.sA;
        s.flipBooleanFields().reflectStruct().incrementIntFields();

        let t = self.sA;
        t = t.flipBooleanFields().reflectStruct().incrementIntFields();

        let z = self.sA;
        z.flipBooleanFields();
        z.reflectStruct();
        z.incrementIntFields();

        return self.checkAllContractFieldsAreUnchanged() &&
               s.a1 == 20 &&    
               s.a2.b1 == false &&   
               s.a2.b2.c1 == 5 &&   
               s.a2.b3 == 10 &&     

               t.a1 == 21 &&    
               t.a2.b1 == false &&   
               t.a2.b2.c1 == 6 &&    
               t.a2.b3 == 11 &&

               z.a1 == 21 &&    
               z.a2.b1 == false &&   
               z.a2.b2.c1 == 6 &&    
               z.a2.b3 == 11;
    }


    /*************** Maps ********************/

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
            result &&= (k == 1 || k == 2 || k == 3);
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
            result &&= (k == 1 || k == 2 || k == 3);
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
            result &&= k == 1;
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
            result &&= k == 1;
        }

        return result;
    }

    get fun mutateParamMap1(): Bool {

        let s = MapWrapper {m: self.mA};

        // This should reassign s.m, but leave self.mA unchanged.

        s.reassignMap();

        let result = 
               self.checkAllContractFieldsAreUnchanged() &&
               s.m.get(1)!!.a1 == 0 && 
               s.m.get(1)!!.a2.b1 == false &&
               s.m.get(1)!!.a2.b2.c1 == 0 &&
               s.m.get(1)!!.a2.b3 == 0;
        
        // And no other entries 
        foreach (k, _ in s.m) {
            result &&= k == 1;
        }

        return result;
    }

    get fun mutateParamMap2(): Bool {

        let s = MapWrapper {m: self.mA};

        // This should mutate entry 1 in s.m, and delete entries 2 and 3, but leave self.mA unchanged.
        
        s.changeSomeEntries();

        let result = 
               self.checkAllContractFieldsAreUnchanged() &&
               s.m.get(1)!!.a1 == 20 && 
               s.m.get(1)!!.a2.b1 == true &&
               s.m.get(1)!!.a2.b2.c1 == 35 &&
               s.m.get(1)!!.a2.b3 == 10;
        
        // And no other entries 
        foreach (k, _ in s.m) {
            result &&= k == 1;
        }

        return result;
    }

    get fun testReturnedMaps1(): Bool {
        // The "get" function for maps always creates a copy of the input map 
        // because "get" is a non-mutating function. This means that
        // the following expression will not change the struct in entry 2 of self.mA,
        // even if "changeSomeFields" is a mutating function for structs.
        // The mutating function "changeSomeFields" is changing the copy
        // returned by "get".

        self.mA.get(2)!!.changeSomeFields();

        // Everything remains the same

        return self.checkAllContractFieldsAreUnchanged();
    } 

    /* 
    The following test cannot be carried out because FunC reports errors. See issue #866.
    But the comments inside the test are good hypotheses of what I expect it will happen 
    when the issue is resolved, because this is what happens in the case of structs (see 
    function testReturnedStructs).

    get fun testReturnedMaps2(): Bool {
        // The call to the non-mutating extends function "unwrapAndCopyMap" always makes a copy
        // of the parameter. Therefore, passing the result to the mutating function 
        // "del" will modify the copy, not the original. 

        let wm = MapWrapper {m: self.mA};

        wm.unwrapAndCopyMap().del(1);  // FunC error: issue #866

        // The contract fields remain the same and also wm
        let result = 
               self.checkAllContractFieldsAreUnchanged() &&
               wm.m.get(1)!!.a1 == 20 && 
               wm.m.get(1)!!.a2.b1 == true &&
               wm.m.get(1)!!.a2.b2.c1 == 5 &&
               wm.m.get(1)!!.a2.b3 == 10 &&

               wm.m.get(2)!!.a1 == 20 && 
               wm.m.get(2)!!.a2.b1 == true &&
               wm.m.get(2)!!.a2.b2.c1 == 100 &&
               wm.m.get(2)!!.a2.b3 == 0 &&

               wm.m.get(3)!!.a1 == 5 && 
               wm.m.get(3)!!.a2.b1 == false &&
               wm.m.get(3)!!.a2.b2.c1 == 150 &&
               wm.m.get(3)!!.a2.b3 == 0;

        foreach (k, _ in wm.m) {
            result = result && (k == 1 || k == 2 || k == 3);
        }

        // Instead, passing "wm" to the mutating function "unwrapMap", 
        // will return a copy of "wm.m", which is then given as input to "del".
        // This means that the following expression does not delete entry 1
        // from wm.m, but deleted from the copy of wm.m:

        wm.unwrapMap().del(1);  // FunC error: issue #866

        // The contract fields remain the same and also wm
        result = result &&
               self.checkAllContractFieldsAreUnchanged() &&
               wm.m.get(1)!!.a1 == 20 && 
               wm.m.get(1)!!.a2.b1 == true &&
               wm.m.get(1)!!.a2.b2.c1 == 5 &&
               wm.m.get(1)!!.a2.b3 == 10 &&

               wm.m.get(2)!!.a1 == 20 && 
               wm.m.get(2)!!.a2.b1 == true &&
               wm.m.get(2)!!.a2.b2.c1 == 100 &&
               wm.m.get(2)!!.a2.b3 == 0 &&

               wm.m.get(3)!!.a1 == 5 && 
               wm.m.get(3)!!.a2.b1 == false &&
               wm.m.get(3)!!.a2.b2.c1 == 150 &&
               wm.m.get(3)!!.a2.b3 == 0;

        foreach (k, _ in wm.m) {
            result = result && (k == 1 || k == 2 || k == 3);
        }

        // Since unwrapMap always returns a copy of wm.m, it is not possible 
        // to delete entries indirectly through the use of unwrapMap.
        // Therefore, the only way is to directly unwrap the map:

        wm.m.del(1);

        // The contract fields remain the same and wm only lost entry 1
        result = result &&
               self.checkAllContractFieldsAreUnchanged() &&

               wm.m.get(2)!!.a1 == 20 && 
               wm.m.get(2)!!.a2.b1 == true &&
               wm.m.get(2)!!.a2.b2.c1 == 100 &&
               wm.m.get(2)!!.a2.b3 == 0 &&

               wm.m.get(3)!!.a1 == 5 && 
               wm.m.get(3)!!.a2.b1 == false &&
               wm.m.get(3)!!.a2.b2.c1 == 150 &&
               wm.m.get(3)!!.a2.b3 == 0;

        foreach (k, _ in wm.m) {
            result = result && (k == 2 || k == 3);
        }

        // Hence, chaining mutating functions to attempt to delete another entry,
        // will not change wm, because those functions always return copies:

        wm.reflectMap().unwrapMap().del(2);  // FunC error: issue #866

        // The contract fields remain the same and wm remains as in the previous step
        result = result &&
               self.checkAllContractFieldsAreUnchanged() &&

               wm.m.get(2)!!.a1 == 20 && 
               wm.m.get(2)!!.a2.b1 == true &&
               wm.m.get(2)!!.a2.b2.c1 == 100 &&
               wm.m.get(2)!!.a2.b3 == 0 &&

               wm.m.get(3)!!.a1 == 5 && 
               wm.m.get(3)!!.a2.b1 == false &&
               wm.m.get(3)!!.a2.b2.c1 == 150 &&
               wm.m.get(3)!!.a2.b3 == 0;

        foreach (k, _ in wm.m) {
            result = result && (k == 2 || k == 3);
        }

        return result;
    }
    
    FINISHES Test that cannot be carried out.
    */

    get fun mutateNestedMap1(): Bool {
        // Make a local copy of self.mC for the tests.
        let m = self.mC;

        // The map m has the single entry 100 -> MapWrap {m: 10 -> copy of self.sA}
        
        // Modify the internal struct in m 
        // This should not change self.mC.

        // Note that it is not possible to change the internal struct directly using:

        // m.get(100)!!.m.get(10)!!.a2.b2.c1 = XXX;
        
        // because the left side of an assignment must be a path expression.
        // Hence, we need to assign the struct first into a variable:

        let s = m.get(100)!!.m.get(10)!!;

        // But recall that s is a COPY of the struct inside the nested map (since assignments are always by value).
        // Indeed, if we change s, the nested map in m does not change.

        s.a2.b2.c1 = 1000;

        // Check that s does change 

        let result = s.a1 == 20 && 
                     s.a2.b1 == true &&
                     s.a2.b2.c1 == 1000 &&
                     s.a2.b3 == 10;

        // But m does not change
        foreach (k1, v1 in m) {
            foreach (k2, v2 in v1.m) {
                result = result && 
                         k1 == 100 && 
                         k2 == 10 &&
                         
                         v2.a1 == 20 && 
                         v2.a2.b1 == true &&
                         v2.a2.b2.c1 == 5 &&
                         v2.a2.b3 == 10;
            }
        }

        // Hence, we need to assign s back into m

        // However, the following expression will not work,
        // because the "get" function always makes a copy of "m" (see test "testReturnedMaps1" above).
        // m.get(100)!!.m.set(10, s);

        // This means we are forced to update the entire entry for key 100. 
        
        // The fact that "get" always returns copies of nested structures has one big consequence: 
        // it is not possible to update a deeply nested map without rebuilding the map of the root
        // key that leads to the updated nested map, i.e.,
        // if the map is:
        // key1 -> [
        //          key1.1 -> [key1.1.1 -> val1], 
        //          key1.2 -> [key1.2.1 -> val2]
        //         ]
        // Then, updating the entry key1.1.1 with value val3 would require 
        // updating key1 with 
        //         [
        //          key1.1 -> [key1.1.1 -> val3], 
        //          key1.2 -> [key1.2.1 -> val2]
        //         ]

        // First build the map containing the updated s and wrap it
        let nestedMap1: map<Int,SA> = emptyMap();
        nestedMap1.set(10, s);
        let wrappedNested1 = MapWrapper {m: nestedMap1};

        // As a side note: we can also achieve the same result by doing this:
        let wrappedNested2 = MapWrapper {m: emptyMap()};
        wrappedNested2.m.set(10, s);

        // Indeed, wrappedNested1 and wrappedNested2 are equal

        foreach (k2, v2 in wrappedNested1.m) {
                result = result && 
                k2 == 10 &&
                         
                v2.a1 == 20 && 
                v2.a2.b1 == true &&
                v2.a2.b2.c1 == 1000 &&
                v2.a2.b3 == 10;
        }

        foreach (k2, v2 in wrappedNested2.m) {
                result = result && 
                k2 == 10 &&
                         
                v2.a1 == 20 && 
                v2.a2.b1 == true &&
                v2.a2.b2.c1 == 1000 &&
                v2.a2.b3 == 10;
        }

        // Finally, assign the wrapped map to the key 100
        m.set(100, wrappedNested1);

        // Check that m changed

        foreach (k1, v1 in m) {
            foreach (k2, v2 in v1.m) {
                result = result && 
                         k1 == 100 && 
                         k2 == 10 &&
                         
                         v2.a1 == 20 && 
                         v2.a2.b1 == true &&
                         v2.a2.b2.c1 == 1000 &&
                         v2.a2.b3 == 10;
            }
        }

        // The rest of the fields in the contract did not change (including self.mC).
        result = result && self.checkAllContractFieldsAreUnchanged();

        return result;
    }

    /*************** Contracts ********************/

    get fun contractAssign1(): Bool {
        
        // Contract assignment works by value, which means that a copy of the contract is created 
        // during assignment.
        
        let c = self;

        // What does it mean that c is a copy? It does NOT mean that 
        // there is a new contract c deployed in the TON network. In fact, both c and self
        // have the same address. Why? An address is determined by the initial state and code
        // of the contract, and since c was created from the state of self AFTER self was deployed,
        // c must have the same address. Indeed, there is a test in "semantics.spec.ts" testing that
        // the address of "self" does not change after "self" is reassigned with a modified copy of itself.
        
        // Even though the states of c and self may diverge from this moment 
        // (for example, by explicitly changing a field in c),
        // the state of c does not have existence beyond the execution of the TVM, i.e.,
        // as long as "self = c" is never executed, the state of c will be lost as soon as 
        // the TVM finishes executing the transaction, because the state of c will never 
        // be persisted back into the network. So, in a sense, c is like a struct storing temporal values 
        // for the fields in self.

        // Nevertheless, it is possible to call declared contract functions on c.
        // For example, getter checkAllContractFieldsAreUnchanged is called both on self
        // and c below, which implies that both self and c have identical state so far.

        let result = 
               self.checkAllContractFieldsAreUnchanged() &&

               // Note that this will check that the state of the copy is identical to self.
               c.checkAllContractFieldsAreUnchanged();

        return result;
    }

    get fun contractAssign2(): Bool {
        
        // Contract assignment works by value, which means that a copy of the contract is created 
        // during assignment.
        
        let c = self;

        // Delete entries 1 and 2 in c.mA. This should not affect self.
        c.mA.del(1);
        c.mA.del(2);

        let result = 
               self.checkAllContractFieldsAreUnchanged() &&
               
               c.uB.b1 == false &&
               c.uB.b2.c1 == 0 &&
               c.uB.b3 == 14 &&
               
               c.sA.a1 == 20 && 
               c.sA.a2.b1 == true &&
               c.sA.a2.b2.c1 == 5 &&
               c.sA.a2.b3 == 10 &&

               c.sB.b1 == false &&
               c.sB.b2.c1 == 3 &&
               c.sB.b3 == 10 &&

               c.sC.c1 == 5 &&

               c.mB.isEmpty() && 

               // the map c.mA has one key-value pair:

               c.mA.get(3)!!.a1 == 5 && 
               c.mA.get(3)!!.a2.b1 == false &&
               c.mA.get(3)!!.a2.b2.c1 == 150 &&
               c.mA.get(3)!!.a2.b3 == 0;

        // And no other entries
        foreach (k, _ in c.mA) {
            result &&= k == 3;
        }

        return result;
    }


    get fun paramContract(): Bool {
        
        // This should not modify self.
        // This function will copy self and do the following changes to the copy: 
        // Change the uB field and delete entry 1 in mA.

        let c = copyAndModifyContract(self);

        let result = 
               self.checkAllContractFieldsAreUnchanged() &&
               
               c.uB.b1 == true &&
               c.uB.b2.c1 == 99 &&
               c.uB.b3 == 98 &&
               
               c.sA.a1 == 20 && 
               c.sA.a2.b1 == true &&
               c.sA.a2.b2.c1 == 5 &&
               c.sA.a2.b3 == 10 &&

               c.sB.b1 == false &&
               c.sB.b2.c1 == 3 &&
               c.sB.b3 == 10 &&

               c.sC.c1 == 5 &&

               c.mB.isEmpty() && 

               // the map c.mA has two key-value pairs:

               c.mA.get(2)!!.a1 == 20 && 
               c.mA.get(2)!!.a2.b1 == true &&
               c.mA.get(2)!!.a2.b2.c1 == 100 &&
               c.mA.get(2)!!.a2.b3 == 0 &&

               c.mA.get(3)!!.a1 == 5 && 
               c.mA.get(3)!!.a2.b1 == false &&
               c.mA.get(3)!!.a2.b2.c1 == 150 &&
               c.mA.get(3)!!.a2.b3 == 0;

        // And no other entries
        foreach (k, _ in c.mA) {
            result &&= (k == 2 || k == 3);
        }

        return result;
    }

    get fun mutateParamContract(): Bool {

        // First, make a copy of the contract
        let c = self;
        
        // This should not modify self.
        // In the copy: it will change the uB field and the sA.a2.b2.c1 field.
        
        c.changeSomeContractFields();

        /* If we were not in a getter function we could persist the changes in the copy 
           back into persistent storage, by writing:
           
           self = c;
           
           Nevertheless, the compiler does not report such line as an error inside a getter 
           function: see issue #818
        */

        let result = 
               self.checkAllContractFieldsAreUnchanged() &&

               c.uB.b1 == true &&
               c.uB.b2.c1 == 77 &&
               c.uB.b3 == 88 &&

               c.sA.a1 == 20 && 
               c.sA.a2.b1 == true &&
               c.sA.a2.b2.c1 == 35 &&
               c.sA.a2.b3 == 10 &&

               c.sB.b1 == false &&
               c.sB.b2.c1 == 3 &&
               c.sB.b3 == 10 &&

               c.sC.c1 == 5 &&

               c.mB.isEmpty() && 

               c.mA.get(1)!!.a1 == 20 && 
               c.mA.get(1)!!.a2.b1 == true &&
               c.mA.get(1)!!.a2.b2.c1 == 5 &&
               c.mA.get(1)!!.a2.b3 == 10 &&

               c.mA.get(2)!!.a1 == 20 && 
               c.mA.get(2)!!.a2.b1 == true &&
               c.mA.get(2)!!.a2.b2.c1 == 100 &&
               c.mA.get(2)!!.a2.b3 == 0 &&

               c.mA.get(3)!!.a1 == 5 && 
               c.mA.get(3)!!.a2.b1 == false &&
               c.mA.get(3)!!.a2.b2.c1 == 150 &&
               c.mA.get(3)!!.a2.b3 == 0;

        // And no other entries
        foreach (k, _ in c.mA) {
            result &&= (k == 1 || k == 2 || k == 3);
        }

        return result;
    }

    get fun address(): Address {
        return myAddress();
    }

    // Check if fields uB and sA.a2.b2.c1 are equal to the provided parameters,
    // and that the rest of fields remained unchanged.

    fun checkFieldsEqualTo(sB: SB, n: Int): Bool {
        let result = 
               self.uB.b1 == sB.b1 &&
               self.uB.b2.c1 == sB.b2.c1 &&
               self.uB.b3 == sB.b3 &&

               self.sA.a1 == 20 && 
               self.sA.a2.b1 == true &&
               self.sA.a2.b2.c1 == n &&
               self.sA.a2.b3 == 10 &&

               self.sB.b1 == false &&
               self.sB.b2.c1 == 3 &&
               self.sB.b3 == 10 &&

               self.sC.c1 == 5 &&

               self.mB.isEmpty() && 

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
            result &&= (k == 1 || k == 2 || k == 3);
        }

        // The map self.mC has a single entry 100 -> MapWrapper {m: 10 -> original self.sA}.
        foreach (k1, v1 in self.mC) {
            foreach (k2, v2 in v1.m) {
                result = result && 
                         k1 == 100 && 
                         k2 == 10 &&
                         
                         v2.a1 == 20 && 
                         v2.a2.b1 == true &&
                         v2.a2.b2.c1 == 5 &&
                         v2.a2.b3 == 10;
            }
        }

        return result;
    }

    fun mutateContractState(): Bool {
        // First, make a copy of the contract
        let c = self;
        
        // In the copy, change the uB field and the sA.a2.b2.c1 field.
        
        c.changeSomeContractFields();

        let result = 
               self.checkAllContractFieldsAreUnchanged() &&

               // This line tests that method calls on copies actually use the state of the copy.
               c.checkFieldsEqualTo(SB {b1: true, b2: SC {c1: 77}, b3: 88}, 35);

        // Persist the copy into self
        
        self = c;

        // Now, check that the changes in c are now in self.
        // Note that checkFieldsEqualTo is called on self now.

        result &&= self.checkFieldsEqualTo(SB {b1: true, b2: SC {c1: 77}, b3: 88}, 35);

        return result;
    }

    get fun testReturnedContracts(): Bool {
        // The call to the non-mutating extends function "copyContract" always makes a copy
        // of the parameter contract. Therefore, passing the result to the mutating function 
        // "changeSomeContractFields" will modify the copy, not the original contract. 
    
        self.copyContract().changeSomeContractFields();

        let result = 
               self.checkAllContractFieldsAreUnchanged();

        // For the following test, make a copy of self.
        let c = self;

        // Now consider this expression:

        c.reflectContract().changeSomeContractFields();

        // Again, passing "c" to the mutating function "reflectContract",
        // will reassign back to c a copy of c, but it will also pass the copy of c to 
        // changeSomeContractFields.
        // This means that the above expression will not modify c.
        // Note that since the return type of changeSomeContractFields is void,
        // we cannot use the trick:
        // 
        // c = c.reflectContract().changeSomeContractFields();
        //
        // to actually update c. Hence, the only ways are to directly call 
        // changeSomeContractFields or divide the expression into steps:
        // 
        // c.changeSomeContractFields();
        // 
        // or:
        // 
        // c.reflectContract();  
        // c.changeSomeContractFields();

        // Nothing changed
        result = result &&
               self.checkAllContractFieldsAreUnchanged() &&
               c.checkAllContractFieldsAreUnchanged();

        // When chaining mutating functions, one needs to reassign c in order to mutate it,
        // because the chain passes copies to the next mutating function,
        // and the copy returned by the last mutating function will be lost 
        // if not reassigned back into c:
        
        c = c.reflectContract().incrementIntFieldsInUB().flipBooleanFieldsInUB();

        // c is now changed, the rest remains the same.
        result = result && 
               self.checkAllContractFieldsAreUnchanged() &&
               c.checkFieldsEqualTo(SB {b1: true, b2: SC {c1: 1}, b3: 15}, 5);

        return result;

    }

    get fun mutateContractStateFlag(): Bool {   
        return self.mutateContractStateResult;
    }

    get fun changesPersisted(): Bool {
        return self.checkFieldsEqualTo(SB {b1: true, b2: SC {c1: 77}, b3: 88}, 35);
    }


    /*************** Integers ********************/

    /*
    The following functions exemplify how to properly chain mutating functions.
    Each function in the chain returns a copy to the next function in the chain.
    Hence, to change the original variable, we need to reassign the value returned 
    from the last mutating function.

    Another way that is actually less confusing, is to simply break the chain
    into single steps.

    */
    get fun mutatesChainInt1(): Bool {
        let s = 2;
        s.multiplyBy2().increment().doNothing();  // s is changed only by the first mutating function.
        
        let t = 2;
        t = t.multiplyBy2().increment().doNothing(); // t reassigned with the value returned by the last function.
        
        // The less confusing solution is to simply break the chain.
        // This solution even works when the last function in the chain has void return type.
        // Each step changes z

        let z = 2;
        z.multiplyBy2();
        z.increment();
        z.doNothing();

        return s == 4 && t == 5 && z == 5;
    }

    get fun mutatesChainInt2(): Bool {
        let s = 2;
        s.multiplyBy2().doNothing().increment();
        
        let t = 2;
        t = t.multiplyBy2().doNothing().increment();  
        
        let z = 2;
        z.multiplyBy2();
        z.doNothing();
        z.increment();  

        return s == 4 && t == 5 && z == 5;
    }

    get fun mutatesChainInt3(): Bool {
        let s = 2;
        s.doNothing().multiplyBy2().increment();

        let t = 2;
        t = t.doNothing().multiplyBy2().increment();
        
        let z = 2;
        z.doNothing();
        z.multiplyBy2();
        z.increment();

        return s == 2 && t == 5 && z == 5;
    }

    get fun mutatesChainInt4(): Bool {
        let s = 2;
        s.doNothing().increment().multiplyBy2();

        let t = 2;
        t = t.doNothing().increment().multiplyBy2();

        let z = 2;
        z.doNothing();
        z.increment();
        z.multiplyBy2();

        return s == 2 && t == 6 && z == 6;
    }    

    get fun mutatesChainInt5(): Bool {
        let s = 2;
        s.increment().doNothing().multiplyBy2();

        let t = 2;
        t = t.increment().doNothing().multiplyBy2();

        let z = 2;
        z.increment();
        z.doNothing();
        z.multiplyBy2();

        return s == 3 && t == 6 && z == 6;
    }

    get fun mutatesChainInt6(): Bool {
        let s = 2;
        s.increment().multiplyBy2().doNothing();

        let t = 2;
        t = t.increment().multiplyBy2().doNothing();

        let z = 2;
        z.increment();
        z.multiplyBy2();
        z.doNothing();

        return s == 3 && t == 6 && z == 6;
    }
}
