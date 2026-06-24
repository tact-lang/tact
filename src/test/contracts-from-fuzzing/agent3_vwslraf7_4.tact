trait ConflictTrait {
    fun f(): Int { return 100; }
}

contract ConflictContract(f: Int) with ConflictTrait {
    receive() {
         // Here, 'f' is both a contract parameter (thus a field) and a function from ConflictTrait.
         // According to typical language semantics, this should lead to an ambiguity.
         dump(self.f());
         cashback(sender());
    }
}
