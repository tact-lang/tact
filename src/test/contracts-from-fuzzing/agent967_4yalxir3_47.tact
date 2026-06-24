// Attempting deeply nested large optional structure
struct O1 { next: O2?; }
struct O2 { next: O3?; }
struct O3 { next: O4?; }
struct O4 { next: O5?; }
struct O5 { next: O6?; }
struct O6 { next: O7?; }
struct O7 { next: O8?; }
struct O8 { final: Int?; }

contract DeepOptionChain {
    chain: O1;

    init() {
        self.chain = O1{next: O2{next: O3{next: O4{next: O5{next: O6{next: O7{next: O8{final:null}}}}}}}};
    }
}