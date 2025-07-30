// Attempt to initialize contract parameter inside the contract (shouldn't work)
contract ParamsExample(
    p1: Int,
    p2: Int
) {
    // Not allowed: redeclaring param as persistent
    // p1: Int = 5; 
}