primitive Int;
primitive Bool;
trait BaseTrait { }

struct Pair { x: Int; y: Int; }

extends mutates fun inc(self: Int) { self += 1 }

extends mutates fun modifyPair(self: Pair) { self.x = 42 }

asm fun swapStorage(x: StorageAnalysis): StorageAnalysis { SWAP }

asm fun setStorage(): StorageAnalysis { 41 PUSHINT 43 PUSHINT }

asm fun throw(code: Int) { THROWARG }

fun throwUnless(code: Int, condition: Bool) { if (condition) { throw(code) } }   

extends mutates fun modifyingExternalContractMethod(self: StorageAnalysis) {
    self.map1.del(42);
}

asm fun blockConstEval(x: Int): Int { DUP DROP }

extends fun nonModifyingExternalContractMethod(self: StorageAnalysis): Int? {
    return self.map1.get(42);
}

extends fun modifyingRecursiveExternalContractMethod(self: StorageAnalysis) {
    self.x1 -= 1;
    if (self.x1 > 0) { self.modifyingRecursiveExternalContractMethod() }
}

extends mutates fun incIfNotNull(self: Int?) {
    if (self != null) { self = self!! + 1 }
}

contract StorageAnalysis {
    x1: Int = 0;
    x2: Int = 0;
    pair: Pair = Pair { x: 0, y: 0 };
    map1: map<Int, Int>;

    receive() { } // Deploy

    receive("direct regular assignment into storage var") {
        self.x1 = 42;
    }

    receive("direct regular assignment into storage struct field") {
        self.pair.x = 42;
    }

    receive("direct regular assignment: no storage write") {
        let x = self.x1 + self.pair.x;
        x = 42;
    }

    receive("direct augmented assignment into storage") {
        self.x1 += 1;
    }

    receive("direct augmented assignment into storage struct field") {
        self.pair.x += 1;
    }

    receive("direct augmented assignment: no storage") {
        let x1 = 42;
        x1 += 1;
    }

    receive("calling a mutating method on a contract variable: mutates") {
        if (true) { self.x1.inc() }
    }

    receive("calling a mutating method on a contract struct field: mutates") {
        if (true) { self.pair.x.inc() }
    }

    receive("calling a mutating method on a contract struct: mutates") {
        if (true) { self.pair.modifyPair() }
    }

    receive("calling a mutating method on a struct: no mutates - 1") {
        let pair = Pair { x: 0, y: 0 };
        if (true) { pair.modifyPair() }
    }

    receive("calling a mutating method on a struct: no mutates - 2") {
        let pair = self.pair;
        if (true) { pair.modifyPair() }
    }

    receive("calling a mutating method on a contract variable and struct field: no mutation") {
        if (true) { (self.x1 + self.pair.y).inc() }
    }

    receive("rewrite in a contract method") {
        self.modifyingContractMethod()
    }

    fun modifyingContractMethod() { self.x1 = 42 }

    receive("transitively modifying contract method") {
        self.transitivelyModifyingContractMethod()
    }

    fun transitivelyModifyingContractMethod() { self.modifyingContractMethod() }

    receive("read and modify in a contract method") {
        self.readAndModify()
    }

    fun readAndModify() { self.x1 += 1 }

    receive("non-modifying contract method") {
        self.nonModifyingContractMethod()
    }

    fun nonModifyingContractMethod() { throwUnless(710, self.x1 != 42) }

    receive("asm function modifies contract storage via assigning to `self`: swapStorage") {
        self = swapStorage(self);
    }

    receive("asm function modifies contract storage via assigning to `self`: setStorage") {
        self = setStorage();
    }

    receive("modifying map method on a contract map") {
        self.map1.set(1, 1);
    }

    receive("non-modifying map method on a contract map") {
        throwUnless(700, self.map1.exists(1));
    }

    receive("modifying external contract method") {
        self.modifyingExternalContractMethod();
    }

    receive("non-modifying external contract method") {
        self.nonModifyingExternalContractMethod();
    }

    receive("non-modifying recursive contract method") {
        self.nonModifyingRecursiveContractMethod(42);
    }

    fun nonModifyingRecursiveContractMethod(x: Int): Int {
        if (x > 0) {
            self.nonModifyingRecursiveContractMethod(x - 1);
        }
        return 0;
    }

    receive("modifying recursive contract method") {
        self.modifyingRecursiveContractMethod();
    }

    fun modifyingRecursiveContractMethod() {
        self.x1 -= 1;
        if (self.x1 > 0) { self.modifyingRecursiveContractMethod() }
    }

    receive("modifying recursive external contract method") {
        self.modifyingRecursiveExternalContractMethod();
    }

    receive("non-modifying mutually recursive contract methods") {
        self.evenNonModifying(42) && self.oddNonModifying(41);
    }

    fun evenNonModifying(x: Int): Bool { return (x == 0) || self.oddNonModifying(x - 1) }
    fun oddNonModifying(x: Int): Bool { return (x == 1) || self.evenNonModifying(x - 1) }

    receive("modifying mutually recursive contract methods") {
        self.evenModifying(42);
    }

    fun evenModifying(x: Int): Bool { return (x == 0) || self.oddModifying(x - 1) }
    fun oddModifying(x: Int): Bool { self.x1 = 41; return (x == 1) || self.evenModifying(x - 1) }

    receive("modifying getter as a contract method") {
        self.modifyingGetter();
    }

    get fun modifyingGetter(): Int {
        self.x1 = 5;
        return 42;
    }

    receive("non-modifying getter as a contract method") {
        self.nonModifyingGetter();
    }

    get fun nonModifyingGetter(): Int {
        return 42;
    }

    receive("complex control flow with deeply nested contract modification") {
        let x = blockConstEval(42);
        while (x > 0) {
            repeat(x) {
                self.complexControlFlow(x);
            }
        }
    }

    fun complexControlFlow(x: Int) {
        do {
            try {
                if (x == 42) {
                    throwUnless(777, self.map1.replaceGet(1, 2) != null);
                }
            }
        } until (x < 0);
    }

    receive("method call on null") {
        null.incIfNotNull();
    }

    receive("toCell on struct field") {
        // This tests the fix for the internal compiler error when calling toCell() on a struct field
        let cell = self.pair.toCell();
    }
}