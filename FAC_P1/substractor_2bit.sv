
// OPERACION RESTA 2 BITS

module substractor_2bit (
    input logic [1:0] a, b,
    output logic [1:0] result,
    output logic sign
);

logic [1:0] inverted;

// Invertir el substraendo (b)
assign inverted[0] = ~b[0];
assign inverted[1] = ~b[1];

logic [1:0] substr;

full_adder_2bit add(inverted, 2'b01, 0, substr); // Complemento a 2

logic [1:0] res;
logic carryout;

full_adder_2bit sub(a, substr, 0, res, carryout); // Resta usando suma

assign sign = carryout;
assign result = res;

endmodule
