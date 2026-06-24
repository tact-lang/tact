// Summary of Fuzz Testing for Contract Addresses in Tact
// 
// 1. Basic Address Handling:
// Constructed a simple contract (TestAddress) that accepts an Address parameter and exposes it via a getter. The snippet compiled successfully, confirming that storage and retrieval of address fields behaves as expected.
// 
// 2. Returning an Address Literal:
// A contract (ReturnAddressLiteral) that returns an address literal was compiled successfully. This validates that correct address literals (in the expected format) are accepted as valid addresses.
// 
// 3. Storing and Loading Addresses via Builder/Slice APIs:
// The function testStoreLoad uses beginCell() -> storeAddress -> endCell -> beginParse -> loadAddress. It compiled as expected, confirming that storing and parsing an Address via the cell API works as documented.
// 
// 4. Type Errors with Address Assignment:
// A deliberate type error was introduced by attempting to assign an Int to an Address field. This snippet (TypeErrorAddress) correctly failed compilation with a type mismatch error.
// 
// 5. Optional Address Fields:
// The OptionAddress contract accepts an Address? parameter and exposes it via a getter. The snippet compiled successfully, confirming the treatment of optional address fields.
// 
// 6. Invalid Bitwise Operations on Addresses:
// The BitwiseAddress contract attempts to use the bitwise OR operator on addresses. As expected, the compiler rejects this usage by producing an error about invalid type for binary operator "|".
// 
// 7. Address Comparison:
// The CompareAddresses contract contains a getter that compares two addresses for equality. This compiled successfully, confirming that address equality comparisons are supported.
// 
// 8. Dynamic Address Creation:
// A function dynamicAddress creates an Address from a dynamic string argument using the built-in address() function. It compiled without issues (though care should be taken that the string is a valid address literal at runtime).
// 
// 9. Mis-serialization of Addresses:
// The function misSerializeAddress intentionally stores an integer instead of an address, then attempts to load it as an address. The snippet compiles successfully. This emphasizes that while static type checking passes, there may be runtime discrepancies if a cell’s contents do not match the expected format. This behavior is consistent with Tact's model of cell serialization/deserialization where type safety is enforced at compile-time but incorrect input may only be discovered at runtime.

// Conclusion:
// All tests confirm that the Tact compiler handles contract addresses as documented. Address-related operations (storage, optionality, comparisons, and literals) behave consistently with expectations, while type errors and invalid operations (bitwise on addresses) are promptly flagged at compile time. The mis-serialization test highlights a potential area of caution: when using Builder/Slice APIs, the developer must ensure that the stored value exactly matches the expected type format to avoid runtime issues.
