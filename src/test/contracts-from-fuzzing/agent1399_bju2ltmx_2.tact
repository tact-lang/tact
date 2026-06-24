contract TestContract {
    intOpt: Int?;                      // implicitly default null optional
    boolOpt: Bool? = null;            // explicit default null optional
    cellOpt: Cell? = null;            // explicit default null optional
    sliceOpt: Slice?;                 // implicitly default null optional
    addressOpt: Address? = null;      // explicit default null optional
    strOpt: String?;                  // implicitly default null optional
}