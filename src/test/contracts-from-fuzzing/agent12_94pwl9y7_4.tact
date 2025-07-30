struct AllowanceMap {
    unbox: map<Address, Int>;
}

contract NestedMapTest {
    get fun testNested(): Int {
         let allowances: map<Address, AllowanceMap> = emptyMap();
         let allowance: AllowanceMap = AllowanceMap { unbox: emptyMap() };
         allowance.unbox.set(myAddress(), 42);
         allowances.set(myAddress(), allowance);
         return allowances.get(myAddress())!!.unbox.get(myAddress())!!;
    }
}
