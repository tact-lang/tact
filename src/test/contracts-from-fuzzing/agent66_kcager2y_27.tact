// Test deeply nested optional chain, but NON-circular
struct O1 { next: O2?; }
struct O2 { next: O3?; }
struct O3 { next: O4?; }
struct O4 { next: O5?; }
struct O5 { final: Int = 5; }

contract OptDeepChain {
 chain: O1 = O1{ next: null };
}