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

// Wrapper struct in order to pass maps to mutating functions. See issue #815
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
            result = result && (k == 1 || k == 2 || k == 3);
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
            result = result && k == 1;
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
            result = result && k == 1;
        }

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
            result = result && k == 3;
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
            result = result && (k == 2 || k == 3);
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
            result = result && (k == 1 || k == 2 || k == 3);
        }

        return result;
    }

    get fun address(): Address {
        return myAddress();
    }

    fun checkFieldsChanged(sB: SB, n: Int): Bool {
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
            result = result && (k == 1 || k == 2 || k == 3);
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
               c.checkFieldsChanged(SB {b1: true, b2: SC {c1: 77}, b3: 88}, 35);

        // Persist the copy into self
        
        self = c;

        // Now, check that the changes in c are now in self.
        // Note that checkFieldsChanged is called on self now.

        result = result && self.checkFieldsChanged(SB {b1: true, b2: SC {c1: 77}, b3: 88}, 35);

        return result;
    }

    get fun mutateContractStateFlag(): Bool {   
        return self.mutateContractStateResult;
    }
}