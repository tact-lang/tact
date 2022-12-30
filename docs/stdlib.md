
# Tact standard library

This section discusses the [stdlib.tact](https://github.com/ton-community/tact/blob/main/stdlib/stdlib.tact) library with standard functions used in Tact.

In following description used Tact language types that specified in the [Type System](/docs/types.md):
* Int
* Bool
* Builder
* Slice
* Cell
* Address
* String
* StringBuilder

## Builder functions.

### Builder primitives
It is said that a primitive *stores* a value `x` into a builder `b` if it returns a modified version of the builder `b'` with the value `x` stored at the end of it.

All of the primitives listed below verify whether there is enough space in the `Builder` first, and then the range of the value being serialized.

#### beginCell
```
beginCell(): Builder
```
Creates a new empty Builder.

#### endCell
```
endCell(s: Builder): Cell
```
Converts `Builder` into an ordinary `Cell`.

#### storeRef
```
storeRef(b: Builder, cell: Cell): Builder
```
Stores a reference `c` into builder `b` and returns updated `b'`.

#### storeUint
```
storeUint(s: Builder, value: Int, bits: Int): Builder
```
Stores an unsigned `bits`-bit integer `value` into `s` for `0 ≤ bits ≤ 256`.

#### storeInt
```
storeInt(s: Builder, value: Int, bits: Int): Builder
```
Stores a signed `len`-bit integer `x` into `b` for `0 ≤ len ≤ 257`.

#### storeBool
```
storeBool(s: Builder, value: Bool): Builder
```
Stores Bool `value` into Builder `s`. It will write to `s` integer `x`.  `x = -1` if `value = True` or `x = 0` integer if `value = False`.

#### storeSlice
```
storeSlice(s: Builder, cell: Slice): Builder
```
Stores slice `cell` into builder `s`.

#### storeCoins
```
storeCoins(s: Builder, value: Int): Builder
```
Stores (serializes) an integer `value` in the range `0..2^120 − 1` into builder `s`. The serialization of `value` consists of a 4-bit unsigned big-endian integer `l`, which is the smallest integer `l ≥ 0`, such that `value < 2^8l`, followed by an `8l`-bit unsigned big-endian representation of `value`. If `value` does not belong to the supported range, a range check exception is thrown.

It is the most common way of storing Toncoins.

### storeAddress
```
storeAddress(s: Builder, address: Address): Builder
```
Stores `address` in Builder `s`. About Address.

### Builder size primitives

#### refs
```
refs(self: Builder): Int
```
Returns the number of cell references already stored in builder `self`.

#### bits
```
bits(self: Builder): Int
```
Returns the number of data bits already stored in builder `self`.

## Slice functions

### Slice primitives
It is said that a primitive *loads* some data if it returns the data and updates original slice. After updates original slice stores only reminder of original data.

It is said that a primitive *preloads* some data if it returns only the data without changing original slice.

Unless otherwise stated, loading and preloading primitives read data from a prefix of the slice.

#### beginParse
```
beginParse(cell: Cell): Slice
```
Converts `cell` into from Cell to Slice. 

#### loadRef
```
loadRef(slice: Slice): Cell
```
Loads the first reference from a `slice`.

#### preloadRef
```
preloadRef(slice: Slice): Cell
```
Preloads the first reference from `slice`.

#### loadInt
```
loadInt(slice: Slice, l: Int): Int
```
Loads a signed `l`-bit integer from `slice`.

#### loadUint
```
loadUint(slice: Slice, l: Int): Int
```
Loads an unsigned `l`-bit integer from `slice`.

#### preloadInt
```
preloadInt(slice: Slice, l: Int): Int
```
Preloads a signed `len`-bit integer from `slice`.

#### preloadUint
```
preloadUint(slice: Slice, l: Int): Int
```
Preloads an unsigned `l`-bit integer from `slice`.

#### loadBits
```
loadBits(slice: Slice, l: Int): Slice
```
Loads the first `0 ≤ l ≤ 1023` bits from `slice` and returns it as a separate Slice.

#### preloadBits
```
preloadBits(slice: Slice, l: Int): Slice
```
Preloads the first `0 ≤ l ≤ 1023` bits from `slice` and returns it as a separate Slice.

#### loadCoins
```
loadCoins(slice: Slice): Int
```
Loads serialized amount of nanoToncoins (any unsigned integer up to `2^120 - 1`).

#### skipBits
```
skipBits(slice: Slice, l: Int): Slice
```
Returns all but the first `0 ≤ l ≤ 1023` bits of `slice`.

#### endParse
```
endParse(slice: Slice)
```
Checks if `slice` is empty. If not, throws an exception.

### Slice size primitives
#### refs
```
refs(slice: Slice): Int
```
Returns the number of references in slice `slice`.

#### bits
```
bits(slice: Slice): Int
```
Returns the number of data bits in slice `slice`.

#### empty
```
empty(slice: Slice): Bool
```
Checks whether slice `slice` is empty (i.e., contains no bits of data and no cell references).

#### dataEmpty
```
dataEmpty(slice: Slice): Bool
```
Checks whether slice `slice` has no bits of data.

#### refsEmpty
```
refsEmpty(slice: Slice): Bool
```
Checks whether slice `slice` has no references.

## Cell functions
### Builder, Cell, Slice conversions

#### asSlice
```
asSlice(data: Builder): Slice
asSlice(data: Cell): Slice
```
Converts `data` from Builder or Cell and returns it as Slice.

#### asCell
```
asSlice(data: Builder): Slice
asSlice(data: Slice): Slice
```
Converts `data` from Builder or Slice and returns it as Cell.

#### emptyCell
```
emptyCell(): Cell
```
Creates and returns empty(without data and references) Cell.


## String primitives

### String builder primitives

#### beginString
```
beginString(): StringBuilder
```
Creates new empty StringBuilder.

#### beginComment
```
beginComment(): StringBuilder
```
Creates new empty StringBuilder for comment.

#### append
```
append(self: StringBuilder, s: String)
```
Append to StringBuilder `self` String `s` and updates it.

#### toCell
```
toCell(self: StringBuilder): Cell
```
Casts StringBuilder `self` to Cell and returns it as a result.

#### toString
```
toString(self: StringBuilder): String
```
Casts StringBuilder `self` to String and returns it as a result.

#### toSlice
```
toSlice(self: StringBuilder): Slice
```
Casts StringBuilder `self` to Slice and returns it as a result.

## String conversion

#### toString
```
toString(self: Int): String
```
Casts `self` Int value to String and returns it as a result.

#### toFloatString
```
toFloatString(self: Int, digits: Int): String
```
Casts float number represented by `self` and `digits` Int values to String and returns it as a result.

Where,
* `self` significant part of float number as Int number;
* `digits` is a exponentiation parameter of expression `10^(-digits)` that will be used for computing float number. `digits` required to be `0 <= digits < 77`.


#### toCoinsString
```
toCoinsString(self: Int): String
```
Casts nanoToncoin Int value `self` to String float number of Toncoins and returns it as a result.

#### asComment
```
asComment(self: String): Cell
```
Casts String `self` to Cell with comment `self` and returns it as a result.

#### asSlice
```
asSlice(self: String): Slice
```
Casts String `self` to Slice and returns it as a result.

#### fromBase64
```
fromBase64(self: Slice): Slice
fromBase64(self: String): Slice
```
Decodes data stored in `self` Slice or String from Base64 format and returns result as a Slice.


## Math primitives

### Random number generator primitives
The pseudo-random number generator uses the random seed, an unsigned 256-bit Integer, and (sometimes) other data kept in c7. The initial value of the random seed before a smart contract is executed in TON Blockchain is a hash of the smart contract address and the global block random seed. If there are several runs of the same smart contract inside a block, then all of these runs will have the same random seed. This can be fixed, for example, by running `randomizeLt` before using the pseudo-random number generator for the first time.

#### random
```
random(): Int
```
Generates a new pseudo-random unsigned 256-bit integer `x`. The algorithm is as follows: if `r` is the old value of the random seed considered a 32-byte array (by constructing the big-endian representation of an unsigned 256-bit integer), then its `sha512(r)` is computed; the first 32 bytes of this hash are stored as the new value `r'` of the random seed, and the remaining 32 bytes are returned as the next random value `x`.

#### randomInterval
```
randomInterval(max: Int): Int
```
Generates a new pseudo-random integer `z` in the range `0..range−1` (or `range..−1` if `range < 0`). More precisely, an unsigned random value `x` is generated as in random; then `z := x * range / 2^256` is computed.

#### randomize
```
randomize(x: Int)
```
Mixes an unsigned 256-bit integer `x` into a random seed `r` by setting the random seed to sha256 of the concatenation of two 32-byte strings: the first with a big-endian representation of the old seed `r`, and the second with a big-endian representation of `x`.

#### randomizeLt()
```
randomizeLt()
```
Gets logical time `Lt` of the current transaction and returns result equal `randomize(Lt)`.

### Math basic primitives

#### min
```
min(x: Int, y: Int): Int
```
Computes the minimum of two integers `x` and `y`.

#### max
```
max(x: Int, y: Int): Int
```
Computes the maximum of two integers `x` and `y`.


#### abs
```
abs(x: Int): Int
```
Computes the absolute value of the integer `x`.


## Hash primitives

#### hash
```
hash(с: Cell): Int
hash(s: Slice): Int
```
Computes the representation hash of Cell `c` or Slice `s` and returns it as a 256-bit unsigned integer `x`. Useful for signing and checking signatures of arbitrary entities represented by a tree of cells.

#### checkSignature
```
checkSignature(hash: Int, signature: Slice, public_key: Int): Bool
```
Checks the Ed25519 `signature` of `hash` (a 256-bit unsigned integer, usually computed as the hash of some data) using `public_key` (also represented by a 256-bit unsigned integer). The signature must contain at least 512 data bits; only the first 512 bits are used. If the signature is valid, the result is 1; otherwise, it is 0. 
Note that `CHKSIGNU` creates a 256-bit slice with the `hash` and calls `CHKSIGNS`. That is, if hash is computed as the hash of some data, this data is hashed twice, the second hashing occurring inside `CHKSIGNS`.

#### checkDataSignature
```
checkDataSignature(data: Slice, signature: Slice, public_key: Slice)
```
Checks whether `signature` is a valid Ed25519 signature of the data portion of `data` using `public_key`, similarly to `checkSignature`. If the bit length of `data` is not divisible by eight, it throws a cell underflow exception. The verification of Ed25519 signatures is a standard one, with sha256 used to reduce `data` to the 256-bit number that is actually signed.



## Other primitives

### Throwing exception

Exceptions can be thrown by conditional primitives `nativeThrowWhen`, and `nativeThrowUnless`, and by unconditional `throw`. The first argument is the error code; the second is the condition (`throw` has only one argument).
#### throw
```
throw(code: Int)
```
Throw exception with error code equal `code`.

#### nativeThrowWhen
```
nativeThrowWhen(code: Int, condition: Bool)
```
Throw exception with error code equal `code` when `condition` equal True.

#### nativeThrowUnless
```
nativeThrowUnless(code: Int, condition: Bool)
```
Throw exception with error code equal `code` when `condition` equal False.

### Context helper
#### context
```
context(): Context
```
Return Struct `Context`, that consists of

| Field   | Type    | Description                                                                                                               |
|---------|---------|---------------------------------------------------------------------------------------------------------------------------|
| bounced | Bool    | [Bounced](https://ton.org/docs/learn/overviews/addresses#bounceable-vs-non-bounceable-addresses) flag of incoming message |
| sender  | Address | Address of sender                                                                                                         |
| value   | Int     | Amount of nanoToncoins in message                                                                                         |
| raw     | Slice   | Slice reminder of message                                                                                                 |

#### readForwardFee
```
readForwardFee(self: Context): Int 
```
Read and computes forward fee from Context and return it as Int value in nanoToncoins.


### Send messages primitives

#### nativeSendMessage
```
nativeSendMessage(cell: Cell, mode: Int)
```

Sends a raw message contained in `cell`, which should contain a correctly serialized object Message X, with the only exception that the source address is allowed to have a dummy value `addr_none` (to be automatically replaced with the current smart contract address), and `ihr_fee`, `fwd_fee`, `created_lt` and `created_at` fields can have arbitrary values (to be rewritten with correct values during the action phase of the current transaction). 

The integer parameter `mode` contains the flag according the table.

| mode                 | Number(FunC) | Description                                                                                                                                                                                                   |
|----------------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SendRemainingBalance | 128          | used for messages that are to carry all the remaining balance of the current smart contract (instead of the value originally indicated in the message)                                                        |
| SendRemainingValue   | 64           | used for messages that carry all the remaining value of the inbound message in addition to the value initially indicated in the new message (if bit 0 is not set, the gas fees are deducted from this amount) |
| SendIgnoreErrors     | 2            | means that any errors arising while processing this message during the action phase should be ignored. Used as additional mode, for example `mode = SendRemainingBalance + SendIgnoreErrors`                  |
| SendPayGasSeparately | 1            | means that the sender wants to pay transfer fees separately. Used as additional mode, for example `mode = SendRemainingBalance + SendPayGasSeparately`                                                        |
| SendDestroyIfZero    | 32           | means that the current account must be destroyed if its resulting balance is zero. This flag is usually employed together with `+ SendRemainingBalance`                                                       |
|                      | 0            | used for ordinary messages                                                                                                                                                                                    |


#### send
```
send(params: SendParameters)
```
Sends message specified by SendParameters `params`, where SendParameters struct described by following table:


| Field      | Type     | Description                                 |
|------------|----------|---------------------------------------------|
| bounce     | Bool     | Bounce flag                                 |
| to         | Address  | Message destination address                 |
| value      | Int      | Amount value in nanoToncoins                |
| mode       | Int      | mode = 0 in SendParameters                  |
| body       | Cell     | Nullable Cell that contents message body    |
| code       | Cell     | Nullable Cell that contents contract's code | 
| data       | Cell     | Nullable Cell that contents contract's data |


#### reply
```
reply(body: Cell?) 
```
Sends bounced message to sender of `body` message.

### Action primitives

#### nativeReserve
```
nativeReserve(amount: Int, mode: Int)
```
Creates an output action which would reserve exactly `amount` nanotoncoins (if `mode = 0`), at most amount nanotoncoins (if `mode = 2`), or all but amount nanotoncoins (if `mode = 1` or `mode = 3`) from the remaining balance of the account. It is roughly equivalent to creating an outbound message carrying amount nanotoncoins (or `b − amount` nanotoncoins, where `b` is the remaining balance) to oneself, so that the subsequent output actions would not be able to spend more money than the remainder. Bit +2 in `mode` means that the external action does not fail if the specified `amount` cannot be reserved; instead, all the remaining balance is reserved. Bit +8 in `mode` means `amount <- -amount` before performing any further actions. Bit +4 in `mode` means that `amount` is increased by the original balance of the current account (before the compute phase), including all extra currencies before performing any other checks and actions. Currently, `amount` must be a non-negative integer, and `mode` must be in the `range 0..15`.


### C4 register primitives (contract primitives)

#### contractAddressExt
```
contractAddressExt(chain: Int, code: Cell, data: Cell): Address
```
Computes smart contract's Address based on its workchain id `chain`, `code`, `data`.

#### contractAddress
```
contractAddress(s: StateInit): Address
```
Computes smart contract's Address based on its StateInit `s`, where `s` is a Struct consists of `code` and `data` Cells. Acts similar to contractAddressExt, but workchain_id permanently equal 0. 

#### myAddress
```
myAddress(): Address
```
Returns the internal address of the current smart contract as a Address.

#### myBalance
```
myBalance(): Int
```
Returns the remaining balance of the smart contract as Int value in NanoToncoins, where NanoToncoin = Toncoin * 10^(−9). Note that RAW primitives such as `send` do not update this field.

### C7 register primitives
Some useful information regarding smart contract invocation can be found in the [c7 special register](https://ton.org/docs/learn/tvm-instructions/tvm-overview#control-registers). These primitives serve for convenient data extraction.
#### now
```
now(): Int
```
Returns the current Unix time as an Integer from c7 register.