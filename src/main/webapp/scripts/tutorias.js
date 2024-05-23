
document.addEventListener('DOMContentLoaded', function() {
    const reservas = document.querySelectorAll('.libre'); 
    let selectedReserva = null;

    reservas.forEach(reserva => {
        reserva.addEventListener('click', function() {
            reservas.forEach(r => r.classList.remove('selected'));
            
            this.classList.add('selected');
            selectedReserva = this.getAttribute('data-id');
            console.log('Reserva seleccionada:', selectedReserva); // Para depuración
        });
    });
});

function confirmReserva() {
    const selectedReservaInput = document.getElementById('selectedReserva');
    
    if (selectedReserva) {
        selectedReservaInput.value = selectedReserva;
        document.getElementById('confirmForm').submit();
    } else {
        alert('Por favor, seleccione una reserva antes de confirmar.');
    }
}