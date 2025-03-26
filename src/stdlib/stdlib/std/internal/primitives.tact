/// `Int` is the primitive 257-bit signed integer type.
///
/// See: https://docs.tact-lang.org/book/integers
///
primitive Int;

/// `Bool` is the classical boolean type, which can hold only two values: `true` and `false`.
/// It is convenient for boolean and logical operations, as well as for storing flags.
///
/// There are no implicit type conversions in Tact, so addition `+` of two boolean values is
/// not possible. However, many comparison operators are available.
///
/// Persisting bools to state is very space-efficient, as they only occupy 1 bit.
/// Storing 1000 bools in state [costs](https://ton.org/docs/develop/smart-contracts/fees#how-to-calculate-fees)
/// about 0.00072 TON per year.
///
/// See: https://docs.tact-lang.org/book/types#booleans
///
primitive Bool;

/// `Builder` is a cell manipulation primitive used for cell creation instructions.
/// They are immutable just like cells and allow constructing new cells from previously
/// stored values and cells.
///
/// Unlike cells, values of type `Builder` appear only on the [TVM] stack and cannot
/// be stored in persistent storage. This means, for example, that persistent storage
/// fields with type `Builder` are actually stored as cells under the hood.
///
/// The `Builder` type represents partially composed cells, for which fast operations
/// to append integers, other cells, references to other cells, and many other operations
/// are defined.
///
/// See:
/// * https://docs.tact-lang.org/book/cells#builders
/// * https://docs.tact-lang.org/ref/core-cells
///
/// [TVM]: https://docs.ton.org/learn/tvm-instructions/tvm-overview
primitive Builder;

/// `Slice` is a cell manipulation primitive used for cell parsing instructions.
/// Unlike cells, slices are mutable and allow extraction or loading of data previously
/// stored in cells via serialization instructions. Also unlike cells, values of type `Slice`
/// appear only on the [TVM] stack and cannot be stored in persistent storage.
/// This means, for example, that persistent storage fields with type `Slice` would actually
/// be stored as cells under the hood.
///
/// The `Slice` type represents either the remainder of a partially parsed cell or a value (subcell)
/// residing inside such a cell, extracted from it by a parsing instruction.
///
/// See:
/// * https://docs.tact-lang.org/book/cells#slices
/// * https://docs.tact-lang.org/ref/core-cells
///
/// [TVM]: https://docs.ton.org/learn/tvm-instructions/tvm-overview
primitive Slice;

/// `Cell` is a primitive and a data structure, which ordinarily consists of up to 1023 continuously
/// laid out bits and up to 4 references (refs) to other cells. Circular references are forbidden and
/// cannot be created by means of [TVM], which means cells can be viewed as [quadtrees]
/// or [directed acyclic graphs (DAGs)][dag] of themselves.
///
/// Contract code itself is represented by a tree of cells.
///
/// Cells and cell primitives are bit-oriented, not byte-oriented: [TVM] regards data kept in cells
/// as sequences (strings or streams) of up to 1023 bits, not bytes. If necessary, contracts are
/// free to use, for example, 21-bit integer fields serialized into [TVM] cells, thus using fewer
/// persistent storage bytes to represent the same data.
///
/// See:
/// * https://docs.tact-lang.org/book/cells#cells
/// * https://docs.tact-lang.org/ref/core-cells
///
/// [TVM]: https://docs.ton.org/learn/tvm-instructions/tvm-overview
/// [quadtrees]: https://en.wikipedia.org/wiki/Quadtree
/// [dag]: https://en.wikipedia.org/wiki/Directed_acyclic_graph
primitive Cell;

/// `Address` is a primitive type that represents a [smart contract address] in TON Blockchain.
///
/// See: https://docs.tact-lang.org/book/types#primitive-types
///
/// [smart contract address]: https://docs.ton.org/learn/overviews/addresses#address-of-smart-contract
primitive Address;

/// `String` is an immutable sequence of characters, which means that once a `String` is created,
/// it cannot be changed. Strings are useful for storing text, so they can be converted to a `Cell`
/// type to be used as message bodies.
///
/// To concatenate strings, use a `StringBuilder`.
///
/// To use `String` literals directly, see: [String literals].
///
/// See:
/// * https://docs.tact-lang.org/book/types#primitive-types
/// * https://docs.tact-lang.org/ref/core-strings
///
/// [String literals]: https://docs.tact-lang.org/book/expressions#string-literals
///
primitive String;

/// `StringBuilder` is a primitive used for efficient string concatenation.
///
/// See:
/// * https://docs.tact-lang.org/book/types#primitive-types
/// * https://docs.tact-lang.org/ref/core-strings
///
primitive StringBuilder;
