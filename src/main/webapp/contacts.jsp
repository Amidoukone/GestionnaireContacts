<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Contacts</title>
    <!-- Intégration de Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-8">
        <h1 class="text-3xl font-bold mb-8">Liste des Contacts</h1>
        <form action="contacts" method="post" class="mb-8">
            <input type="hidden" name="action" value="add">
            <div class="grid grid-cols-4 gap-4">
                <div>
                    <label for="nom" class="block text-sm font-bold">Nom:</label>
                    <input type="text" id="nom" name="nom" class="w-full px-3 py-2 border rounded-md">
                </div>
                <div>
                    <label for="numeroTelephone" class="block text-sm font-bold">Numéro de Téléphone:</label>
                    <input type="text" id="numeroTelephone" name="numeroTelephone" class="w-full px-3 py-2 border rounded-md">
                </div>
                <div>
                    <label for="ville" class="block text-sm font-bold">Ville:</label>
                    <input type="text" id="ville" name="ville" class="w-full px-3 py-2 border rounded-md">
                </div>
                <div>
                    <label for="profession" class="block text-sm font-bold">Profession:</label>
                    <input type="text" id="profession" name="profession" class="w-full px-3 py-2 border rounded-md">
                </div>
            </div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 mt-4 rounded-md">Ajouter Contact</button>
        </form>

        <h2 class="text-2xl font-bold mb-4">Contacts</h2>
        <table class="table-auto w-full">
            <thead>
                <tr>
                    <th class="px-4 py-2 bg-gray-200 text-left">Nom</th>
                    <th class="px-4 py-2 bg-gray-200 text-left">Numéro de Téléphone</th>
                    <th class="px-4 py-2 bg-gray-200 text-left">Ville</th>
                    <th class="px-4 py-2 bg-gray-200 text-left">Profession</th>
                    <th class="px-4 py-2 bg-gray-200 text-left">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="contact" items="${contacts}">
                    <tr>
                        <td class="border px-4 py-2">${contact.nom}</td>
                        <td class="border px-4 py-2">${contact.numeroTelephone}</td>
                        <td class="border px-4 py-2">${contact.ville}</td>
                        <td class="border px-4 py-2">${contact.profession}</td>
                        <td class="border px-4 py-2">
                            <form action="contacts" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${contact.id}">
                                <button type="submit" class="bg-red-500 text-white px-2 py-1 rounded-md">Supprimer</button>
                            </form>
                            <button class="bg-yellow-500 text-white px-2 py-1 rounded-md" onclick="showUpdateForm(${contact.id}, '${contact.nom}', '${contact.numeroTelephone}', '${contact.ville}', '${contact.profession}')">Modifier</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="updateFormContainer" class="hidden">
            <h2 class="text-2xl font-bold mb-4 mt-8">Modifier Contact</h2>
            <form id="updateForm" action="contacts" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" id="updateId" name="id">
                <div class="grid grid-cols-4 gap-4">
                    <div>
                        <label for="updateNom" class="block text-sm font-bold">Nom:</label>
                        <input type="text" id="updateNom" name="nom" class="w-full px-3 py-2 border rounded-md">
                    </div>
                    <div>
                        <label for="updateNumeroTelephone" class="block text-sm font-bold">Numéro de Téléphone:</label>
                        <input type="text" id="updateNumeroTelephone" name="numeroTelephone" class="w-full px-3 py-2 border rounded-md">
                    </div>
                    <div>
                        <label for="updateVille" class="block text-sm font-bold">Ville:</label>
                        <input type="text" id="updateVille" name="ville" class="w-full px-3 py-2 border rounded-md">
                    </div>
                    <div>
                        <label for="updateProfession" class="block text-sm font-bold">Profession:</label>
                        <input type="text" id="updateProfession" name="profession" class="w-full px-3 py-2 border rounded-md">
                    </div>
                </div>
                <button type="submit" class="bg-yellow-500 text-white px-4 py-2 mt-4 rounded-md">Mettre à jour</button>
            </form>
        </div>

        <script>
            function showUpdateForm(id, nom, numeroTelephone, ville, profession) {
                document.getElementById('updateFormContainer').classList.remove('hidden');
                document.getElementById('updateId').value = id;
                document.getElementById('updateNom').value = nom;
                document.getElementById('updateNumeroTelephone').value = numeroTelephone;
                document.getElementById('updateVille').value = ville;
                document.getElementById('updateProfession').value = profession;
            }
        </script>
    </div>
</body>
</html>
